;;; package --- Summary: openvpn wrapper for emacs
;;; section:
(defconst +vpn-proc+ "*vpn-proc*")
(defconst +vpn-name+ "*vpn-status*")
(defconst +vpn-home+ "/cygdrive/d/software/OpenVPNPortable")
(defvar *vpn-proxy* "proxynj.zte.com.cn")

(defun vpn-start ()
  "start openvpn directly"
  (with-current-buffer (get-buffer-create +vpn-name+)
    (let* ((default-directory (concat +vpn-home+ "/data/config/"))
           (cmd "/cygdrive/d/software/OpenVPNPortable/app/bin/openvpn")
           (arg1 "--config")
           (config "./zte.ovpn")
           (arg2 "--http-proxy")
           (proxy-ip *vpn-proxy*))
      (progn
        (start-process +vpn-proc+ +vpn-name+
                       cmd arg1 config arg2 proxy-ip "80" "auto")
        (message "start vpn %s" proxy-ip)
        (set-process-sentinel (get-process +vpn-proc+) 'vpn-dumped)))))

(defun vpn-stop ()
  "stop openvpn "
  (let ((proc (get-process +vpn-proc+)))
    (if (not (null proc))
        (progn
          (set-process-sentinel proc nil)
          (kill-process proc)))))

(defun vpn-dumped (process event)
  "when openvpn dumped, it would be called to resolv"
  (if (null process)
      (vpn-cmd event)
    (progn
      (message "vpn dumped")
      (sleep-for 5)
      (vpn-start))))

;; (vpn-cmd "stop")
(defun vpn-cmd (cmd)
  "control openvpn from emacs"
  (interactive "n 0 - start;1 - stop")
  (cond ((eq cmd 1) (vpn-stop))
        ((eq cmd 0) (vpn-start ))
        (t (message "unknown cmd %d" cmd))))

(defun vpn-monitor ()
  (interactive)
  (vpn-start ))

(provide 'openvpn)
