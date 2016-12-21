(defvar avp-codelist nil)
(setq avp-codelist '(38310
                     ("38310" "AocMessage" "OctetString")
                     299
                     ("299" "Inband-Security-Id" "Unsigned32")
                     257
                     ("257" "Host-IP-Address" "OctetString")
                     266
                     ("266" "Vendor-Id" "Unsigned32")
                     269
                     ("269" "Product-Name" "OctetString")
                     265
                     ("265" "Supported-Vendor-Id" "Unsigned32")
                     259
                     ("259" "Acct-Application-Id" "Integer32")
                     267
                     ("267" "Firmware-Revision" "Unsigned32")
                     260
                     ("260" "Vendor-Specific-Application-Id" "Group")
                     5
                     ("5" "3GPP-GPRS-Negotiated-QoS-Profile" "OctetString")
                     60440
                     ("60440" "TORO-MMS-Information" "Group")
                     60501
                     ("60501" "TORO-Service-Information" "Group")
                     60304
                     ("60304" "TORO-SourceID" "Group")
                     60299
                     ("60299" "TORO-IdType" "Unsigned32")
                     60303
                     ("60303" "TORO-SourceData" "OctetString")
                     60402
                     ("60402" "TORO-RBT-Configuration-Data" "OctetString")
                     60254
                     ("60254" "TORO-Configuration-Channel-Type" "Integer32")
                     60251
                     ("60251" "TORO-Configuration-Channel-Data" "OctetString")
                     60406
                     ("60406" "TORO-RBT-Cost" "OctetString")
                     60409
                     ("60409" "TORO-RBT-Business-Sharing-Type" "Unsigned32")
                     60408
                     ("60408" "TORO-RBT-Time" "Unsigned32")
                     60301
                     ("60301" "TORO-DestinationID" "Group")
                     60302
                     ("60302" "TORO-DestinationData" "OctetString")
                     60305
                     ("60305" "TORO-SourceLocationID" "Group")
                     60315
                     ("60315" "TORO-AdditionalSourceID" "Group")
                     60441
                     ("60441" "TORO-EventTypeMMS" "Integer32")
                     60325
                     ("60325" "TORO-DestinationLocationID" "Group")
                     60313
                     ("60313" "TORO-Location-Type" "Unsigned32")
                     60306
                     ("60306" "TORO-Location-Data" "OctetString")
                     60308
                     ("60308" "TORO-desLocation-Data" "OctetString")
                     60365
                     ("60365" "TORO-MessageSize" "Unsigned32")
                     60447
                     ("60447" "TORO-ReadReplyReportRequested" "Unsigned32")
                     60555
                     ("60555" "TORO-Furnished-Charging-Trigger-Information" "OctetString")
                     60449
                     ("60449" "TORO-Furnished-Charging-Information" "Unsigned32")
                     20347
                     ("20347" "ChargeConfirmFlag" "Unsigned32")
                     50
                     ("50" "Acct-Multi-Session-Id" "OctetString")
                     258
                     ("258" "Auth-Application-Id" "Unsigned32")
                     411
                     ("411" "CC-Correlation-Id" "OctetString")
                     412
                     ("412" "CC-Input-Octets" "Unsigned64")
                     414
                     ("414" "CC-Output-Octets" "Unsigned64")
                     415
                     ("415" "CC-Request-Number" "Unsigned32")
                     416
                     ("416" "CC-Request-Type" "Integer32")
                     417
                     ("417" "CC-Service-Specific-Units" "Unsigned64")
                     418
                     ("418" "CC-Session-Failover" "Integer32")
                     419
                     ("419" "CC-Sub-Session-Id" "Unsigned64")
                     420
                     ("420" "CC-Time" "Unsigned32")
                     18
                     ("18" "3GPP-SGSN-MCC-MNC" "OctetString")
                     421
                     ("421" "CC-Total-Octets" "Unsigned64")
                     454
                     ("454" "CC-Unit-Type" "Integer32")
                     422
                     ("422" "Check-Balance-Result" "Integer32")
                     424
                     ("424" "Cost-Unit" "OctetString")
                     427
                     ("427" "Credit-Control-Failure-Handling" "Integer32")
                     425
                     ("425" "Currency-Code" "Unsigned32")
                     293
                     ("293" "Destination-Host" "OctetString")
                     283
                     ("283" "Destination-Realm" "OctetString")
                     428
                     ("428" "Direct-Debiting-Failure-Handling" "Integer32")
                     281
                     ("281" "Error-Message" "OctetString")
                     294
                     ("294" "Error-Reporting-Host" "OctetString")
                     55
                     ("55" "Event-Timestamp" "OctetString")
                     429
                     ("429" "Exponent" "Integer32")
                     11
                     ("11" "Filter-Id" "OctetString")
                     449
                     ("449" "Final-Unit-Action" "Integer32")
                     453
                     ("453" "G-S-U-Pool-Identifier" "Unsigned32")
                     455
                     ("455" "Multiple-Services-Indicator" "Integer32")
                     264
                     ("264" "Origin-Host" "OctetString")
                     296
                     ("296" "Origin-Realm" "OctetString")
                     278
                     ("278" "Origin-State-Id" "Unsigned32")
                     280
                     ("280" "Proxy-Host" "OctetString")
                     33
                     ("33" "Proxy-State" "OctetString")
                     432
                     ("432" "Rating-Group" "Unsigned32")
                     433
                     ("433" "Redirect-Address-Type" "Integer32")
                     292
                     ("292" "Redirect-Host" "OctetString")
                     261
                     ("261" "Redirect-Host-Usage" "Integer32")
                     262
                     ("262" "Redirect-Max-Cache-Time" "Unsigned32")
                     435
                     ("435" "Redirect-Server-Address" "OctetString")
                     438
                     ("438" "Restriction-Filter-Rule" "OctetString")
                     268
                     ("268" "Result-Code" "Unsigned32")
                     436
                     ("436" "Requested-Action" "Integer32")
                     282
                     ("282" "Route-Record" "OctetString")
                     461
                     ("461" "Service-Context-Id" "OctetString")
                     439
                     ("439" "Service-Identifier" "Unsigned32")
                     263
                     ("263" "Session-Id" "OctetString")
                     450
                     ("450" "Subscription-Id-Type" "Integer32")
                     444
                     ("444" "Subscription-Id-Data" "OctetString")
                     451
                     ("451" "Tariff-Time-Change" "OctetString")
                     452
                     ("452" "Tariff-Change-Usage" "Integer32")
                     295
                     ("295" "Termination-Cause" "Integer32")
                     459
                     ("459" "User-Equipment-Info-Type" "Integer32")
                     460
                     ("460" "User-Equipment-Info-Value" "OctetString")
                     1
                     ("1" "User-Name" "OctetString")
                     448
                     ("448" "Validity-Time" "Unsigned32")
                     447
                     ("447" "Value-Digits" "Integer64")
                     868
                     ("868" "Time-Quota-Threshold" "Unsigned64")
                     869
                     ("869" "Volume-Quota-Threshold" "Unsigned64")
                     870
                     ("870" "Trigger-Type" "Integer32")
                     871
                     ("871" "Quota-Holding-Time" "Integer32")
                     872
                     ("872" "Reporting-Reason" "Integer32")
                     20336
                     ("20336" "Calling-Party-Address" "OctetString")
                     20337
                     ("20337" "Called-Party-Address" "OctetString")
                     20327
                     ("20327" "Real-Called-Number" "OctetString")
                     20373
                     ("20373" "Connect-Called-Number" "OctetString")
                     20338
                     ("20338" "Called-Short-Number" "OctetString")
                     20369
                     ("20369" "Group-Number" "OctetString")
                     20339
                     ("20339" "Charge-Flow-Type" "Unsigned32")
                     20301
                     ("20301" "Calling-Partys-Category" "Unsigned32")
                     20302
                     ("20302" "Calling-Vlr-Number" "OctetString")
                     20303
                     ("20303" "Calling-CellID-Or-SAI" "OctetString")
                     20304
                     ("20304" "Calling-LAI" "OctetString")
                     20305
                     ("20305" "Called-Vlr-Number" "OctetString")
                     20306
                     ("20306" "Called-CellID-Or-SAI" "OctetString")
                     20307
                     ("20307" "Called-LAI" "OctetString")
                     20308
                     ("20308" "Called-IMEI" "OctetString")
                     20309
                     ("20309" "Calling-IMEI" "OctetString")
                     20310
                     ("20310" "Original-Called-Party-Id" "OctetString")
                     20311
                     ("20311" "High-Layer-Compatibility" "OctetString")
                     20312
                     ("20312" "Additional-Calling-Party-Number" "OctetString")
                     20313
                     ("20313" "Bearer-Capability" "OctetString")
                     20314
                     ("20314" "Bearer-Capability2" "OctetString")
                     20315
                     ("20315" "EventType-BCSM" "Unsigned32")
                     20316
                     ("20316" "Redirecting-Party-Id" "OctetString")
                     20317
                     ("20317" "Redirection-Information" "OctetString")
                     20363
                     ("20363" "Redirection-Reason" "Unsigned32")
                     20318
                     ("20318" "UE-IMSI" "OctetString")
                     20319
                     ("20319" "Tele-Service-Code" "OctetString")
                     20320
                     ("20320" "Bearer-Service-Code" "OctetString")
                     20321
                     ("20321" "Call-Reference-Number" "OctetString")
                     20322
                     ("20322" "MSC-Address" "OctetString")
                     20323
                     ("20323" "GMSC-Address" "OctetString")
                     20324
                     ("20324" "Time-Zone" "Unsigned32")
                     20325
                     ("20325" "IN-Service-Indicator" "Unsigned32")
                     20326
                     ("20326" "Charge-Number" "OctetString")
                     20364
                     ("20364" "Card-Batch" "OctetString")
                     20365
                     ("20365" "Card-Type" "Unsigned32")
                     20378
                     ("20378" "Card-Money" "Unsigned32")
                     20343
                     ("20343" "Recharge-Method" "Integer32")
                     20345
                     ("20345" "Money-Type" "Unsigned32")
                     20328
                     ("20328" "Money-Value" "Integer32")
                     20367
                     ("20367" "Active-Day" "Unsigned32")
                     20738
                     ("20738" "ActiveMethod" "Integer32")
                     20372
                     ("20372" "Account-Type" "Unsigned32")
                     20377
                     ("20377" "Service-Type" "Unsigned32")
                     20346
                     ("20346" "Account-Query-Method" "Unsigned32")
                     20362
                     ("20362" "UserPassWd" "OctetString")
                     20340
                     ("20340" "Query-Mode" "Unsigned32")
                     20374
                     ("20374" "Charge-Method" "Integer32")
                     20375
                     ("20375" "Total-Cost-Flag" "Unsigned32")
                     20348
                     ("20348" "Call-Control-Services-Result" "OctetString")
                     20342
                     ("20342" "Card-Number" "OctetString")
                     20357
                     ("20357" "AccountId" "OctetString")
                     20359
                     ("20359" "AccountDate" "OctetString")
                     20361
                     ("20361" "FavCellIdFlag" "Integer32")
                     20330
                     ("20330" "AoC-Balance" "Unsigned32")
                     20331
                     ("20331" "AoC-Language-ID" "Integer32")
                     20333
                     ("20333" "AoC-Start-Time" "Unsigned32")
                     20334
                     ("20334" "AoC-Unit" "Unsigned32")
                     20335
                     ("20335" "AoC-Price" "Unsigned32")
                     20358
                     ("20358" "Access-Code" "OctetString")
                     20354
                     ("20354" "Route-Prefix" "OctetString")
                     20384
                     ("20384" "Calling-Party-NP" "OctetString")
                     20385
                     ("20385" "Called-Party-NP" "OctetString")
                     20386
                     ("20386" "SSP-Time" "OctetString")
                     20387
                     ("20387" "MF-Indicator" "Unsigned32")
                     20388
                     ("20388" "Service-Free-Indicator" "Unsigned32")
                     20350
                     ("20350" "Current-Account-Balance" "Integer64")
                     20351
                     ("20351" "Account-Balance-Change" "Integer64")
                     20352
                     ("20352" "Account-Date-Change" "Integer32")
                     20353
                     ("20353" "Measure-Type" "Integer32")
                     20201
                     ("20201" "IMSI" "OctetString")
                     20712
                     ("20712" "Trade-Time" "OctetString")
                     20707
                     ("20707" "Gift-Method" "Unsigned32")
                     20703
                     ("20703" "Total-Gift-Amount" "Unsigned32")
                     20704
                     ("20704" "First-Gift-Amount" "Unsigned32")
                     20705
                     ("20705" "Total-Months" "Unsigned32")
                     20706
                     ("20706" "State" "Unsigned32")
                     20709
                     ("20709" "Switch-To-HotBilling-Flag" "Unsigned32")
                     20708
                     ("20708" "Specific-Output" "Unsigned32")
                     20431
                     ("20431" "Notify-Mode" "Unsigned32")
                     20392
                     ("20392" "Cost-Type" "Integer32")
                     20393
                     ("20393" "Alart-Flag" "Integer32")
                     20395
                     ("20395" "MessageCount" "Unsigned32")
                     20396
                     ("20396" "MessageContent1" "OctetString")
                     20397
                     ("20397" "MessageContent2" "OctetString")
                     20398
                     ("20398" "MessageContent3" "OctetString")
                     20399
                     ("20399" "MessageContent4" "OctetString")
                     20700
                     ("20700" "MessageContent5" "OctetString")
                     20701
                     ("20701" "MessageContent6" "OctetString")
                     30801
                     ("30801" "Auth-ResultCode" "Unsigned32")
                     30802
                     ("30802" "Auth-userstate" "OctetString")
                     30803
                     ("30803" "Auth-action" "OctetString")
                     30804
                     ("30804" "Auth-VoiceID" "Unsigned32")
                     30805
                     ("30805" "Auth-MessageID" "Unsigned32")
                     30806
                     ("30806" "Auth-subservicekey" "OctetString")
                     20389
                     ("20389" "CardSpID" "Unsigned32")
                     20390
                     ("20390" "FraudTimes" "Unsigned32")
                     20391
                     ("20391" "SerialNo" "OctetString")
                     20731
                     ("20731" "ChargePartyPayType" "Unsigned32")
                     20733
                     ("20733" "ActivePeriod" "OctetString")
                     20734
                     ("20734" "graceperiod" "OctetString")
                     20735
                     ("20735" "disableperiod" "OctetString")
                     20737
                     ("20737" "SubCOSID" "Unsigned32")
                     20732
                     ("20732" "RecieveMessageAddr" "OctetString")
                     20360
                     ("20360" "MIN" "OctetString")
                     20730
                     ("20730" "MSCId" "OctetString")
                     20716
                     ("20716" "Type_of_Charge" "OctetString")
                     20717
                     ("20717" "Transaction_ID" "OctetString")
                     20718
                     ("20718" "Subscriber_Type" "Unsigned32")
                     20719
                     ("20719" "Bearer_Capability" "Unsigned32")
                     20720
                     ("20720" "DiscountPSI" "Unsigned32")
                     20721
                     ("20721" "Message_ID" "Unsigned32")
                     20722
                     ("20722" "Message_Type" "Unsigned32")
                     20401
                     ("20401" "SMSC-Address" "OctetString")
                     20402
                     ("20402" "SM-Id" "OctetString")
                     20403
                     ("20403" "SM-Length" "Unsigned32")
                     20404
                     ("20404" "mo_msc_addr" "OctetString")
                     20405
                     ("20405" "mt_msc_addr" "OctetString")
                     20406
                     ("20406" "source_addr" "OctetString")
                     20407
                     ("20407" "dest_addr" "OctetString")
                     20408
                     ("20408" "fee_addr" "OctetString")
                     20409
                     ("20409" "fee_flag" "Unsigned32")
                     20410
                     ("20410" "fee_type" "Unsigned32")
                     20411
                     ("20411" "fee_ltd_msg_num" "Unsigned32")
                     20412
                     ("20412" "fee_single" "Unsigned32")
                     20413
                     ("20413" "fee_fixed" "Unsigned32")
                     20414
                     ("20414" "message_pid" "Unsigned32")
                     20415
                     ("20415" "status_report_request" "Unsigned32")
                     20416
                     ("20416" "original_group" "Unsigned32")
                     20419
                     ("20419" "Calling_Service" "OctetString")
                     20420
                     ("20420" "Called_Service" "OctetString")
                     20421
                     ("20421" "Original_Msg_ID" "OctetString")
                     20417
                     ("20417" "SMS-Receive-Time" "OctetString")
                     20418
                     ("20418" "send_result" "Unsigned32")
                     20422
                     ("20422" "sp_id" "OctetString")
                     20423
                     ("20423" "Service_Code" "OctetString")
                     20424
                     ("20424" "Msg_ID" "OctetString")
                     20425
                     ("20425" "Source_GWID" "OctetString")
                     20426
                     ("20426" "GWID" "OctetString")
                     20427
                     ("20427" "Priority_flag" "Unsigned32")
                     20428
                     ("20428" "Dest_Address" "OctetString")
                     20429
                     ("20429" "ChargingNo" "OctetString")
                     20713
                     ("20713" "ChargingRate" "Unsigned32")
                     20714
                     ("20714" "ChargingType" "Unsigned32")
                     20432
                     ("20432" "cdrtype" "Unsigned32")
                     20433
                     ("20433" "discount" "Unsigned32")
                     20710
                     ("20710" "state" "Unsigned32")
                     20711
                     ("20711" "msgSeq" "OctetString")
                     20430
                     ("20430" "Operation_Result" "Integer32")
                     20715
                     ("20715" "Sms-Type" "Unsigned32")
                     20601
                     ("20601" "sp-id" "OctetString")
                     20602
                     ("20602" "service-id" "OctetString")
                     20603
                     ("20603" "msg-id" "OctetString")
                     20604
                     ("20604" "smc-addr" "OctetString")
                     20605
                     ("20605" "opt-type" "Integer32")
                     20606
                     ("20606" "need-cnfm" "Integer32")
                     20607
                     ("20607" "sessionid" "Integer32")
                     20608
                     ("20608" "servicetype" "Integer32")
                     20609
                     ("20609" "payer" "Integer32")
                     20610
                     ("20610" "chargemode" "Integer32")
                     20611
                     ("20611" "volume" "Integer32")
                     20612
                     ("20612" "version" "Integer32")
                     20613
                     ("20613" "smlength" "Integer32")
                     20614
                     ("20614" "mo_mscaddr" "OctetString")
                     20615
                     ("20615" "mt_mscaddr" "OctetString")
                     20616
                     ("20616" "sessionactive" "Integer32")
                     20617
                     ("20617" "src" "OctetString")
                     20618
                     ("20618" "dst" "OctetString")
                     20619
                     ("20619" "rate" "Integer32")
                     20620
                     ("20620" "mstat" "Integer32")
                     20621
                     ("20621" "msg-seq" "OctetString")
                     20622
                     ("20622" "amount" "Integer32")
                     20623
                     ("20623" "usedvolume" "Integer32")
                     20624
                     ("20624" "sessioninfo" "OctetString")
                     20355
                     ("20355" "Subscriber-Pay-Type" "Unsigned32")
                     20625
                     ("20625" "CDRProductID" "OctetString")
                     20626
                     ("20626" "CDRChargeMode" "Integer32")
                     20627
                     ("20627" "CDRTimes" "Integer32")
                     20628
                     ("20628" "CDRDuration" "Integer32")
                     20629
                     ("20629" "CDRVolume" "Integer32")
                     20630
                     ("20630" "CDRCDRType" "Integer32")
                     20631
                     ("20631" "CDRServiceType" "Integer32")
                     20632
                     ("20632" "CDRBeginTime" "Integer32")
                     20633
                     ("20633" "CDREndTime" "Integer32")
                     20634
                     ("20634" "CDRPkgSpid" "OctetString")
                     20635
                     ("20635" "CDRPkgServiceid" "OctetString")
                     20636
                     ("20636" "CDRPkgProductid" "OctetString")
                     20637
                     ("20637" "CDRSPName" "OctetString")
                     20638
                     ("20638" "CDRServiceName" "OctetString")
                     20519
                     ("20519" "BearerType" "Integer32")
                     20522
                     ("20522" "BearerProtocolType" "Integer32")
                     20639
                     ("20639" "CategoryID" "Integer64")
                     20640
                     ("20640" "ContentID" "Integer64")
                     20641
                     ("20641" "BearService" "Integer64")
                     20642
                     ("20642" "NetworkType" "Integer64")
                     20643
                     ("20643" "TransctionID" "Integer64")
                     20501
                     ("20501" "Message-Id" "OctetString")
                     20502
                     ("20502" "Charge-Party-Type" "Integer32")
                     20512
                     ("20512" "OAOperaterID" "OctetString")
                     20514
                     ("20514" "DAOperaterID" "OctetString")
                     20504
                     ("20504" "SP-Id" "OctetString")
                     20505
                     ("20505" "Sevice-Enabler-Type" "Integer32")
                     20506
                     ("20506" "Service-Id" "OctetString")
                     20507
                     ("20507" "Service_Type" "Integer32")
                     20508
                     ("20508" "Content-Id" "OctetString")
                     20510
                     ("20510" "Client-IP" "OctetString")
                     20515
                     ("20515" "BaseServiceId" "OctetString")
                     20516
                     ("20516" "Calling-Number" "OctetString")
                     20517
                     ("20517" "Called-Number" "OctetString")
                     20518
                     ("20518" "UserGroup" "OctetString")
                     20520
                     ("20520" "StartTime" "OctetString")
                     20521
                     ("20521" "StopTime" "OctetString")
                     20523
                     ("20523" "UsedUplinkVolume" "Integer32")
                     20524
                     ("20524" "UsedDownlinkVolume" "Integer32")
                     20525
                     ("20525" "APN" "OctetString")
                     20526
                     ("20526" "SGSNIP" "OctetString")
                     20527
                     ("20527" "ChargingID" "OctetString")
                     20528
                     ("20528" "QOS" "OctetString")
                     20529
                     ("20529" "URL" "OctetString")
                     20530
                     ("20530" "SessionTimeout" "Integer32")
                     20531
                     ("20531" "ServiceLevel" "Integer32")
                     20532
                     ("20532" "MsgNum" "Integer32")
                     20533
                     ("20533" "CellID" "OctetString")
                     20740
                     ("20740" "ETopupSessionID" "OctetString")
                     20741
                     ("20741" "QueryStartTime" "Unsigned32")
                     20742
                     ("20742" "QueryEndTime" "Unsigned32")
                     20745
                     ("20745" "NewActiveStop" "OctetString")
                     20746
                     ("20746" "OldActiveStop" "OctetString")
                     20747
                     ("20747" "OldUserState" "OctetString")
                     20748
                     ("20748" "NewUserState" "OctetString")
                     20743
                     ("20743" "TradeTime" "OctetString")
                     20744
                     ("20744" "ErrorType" "Unsigned32")
                     20780
                     ("20780" "Release-Reason" "Integer32")
                     20804
                     ("20804" "Access-Network-Type" "Integer32")
                     60352
                     ("60352" "TORO-ContentType" "Unsigned32")
                     60357
                     ("60357" "TORO-ValidityPeriod" "Unsigned32")
                     60317
                     ("60317" "TORO-IMSI" "OctetString")
                     60328
                     ("60328" "TORO-IMEI" "OctetString")
                     60444
                     ("60444" "TORO-MessagePriority" "Unsigned32")
                     60366
                     ("60366" "TORO-MessageDeliveryRequested" "Unsigned32")
                     60367
                     ("60367" "TORO-DeliveryRequested" "Unsigned32")
                     60422
                     ("60422" "TORO-AdditionalDestinationID" "Group")
                     60423
                     ("60423" "TORO-AdditionalDestinationData" "OctetString")
                     60100
                     ("60100" "TORO-Trigger-Type" "Integer32")
                     60331
                     ("60331" "TORO-SubTriggerType" "OctetString")
                     60448
                     ("60448" "TORO-SouthboundReferenceID" "OctetString")
                     60556
                     ("60556" "TORO-RBT-Business-Sharing-ID" "Group")
                     60557
                     ("60557" "TORO-RBT-Business-Sharing-Name" "OctetString")
                     60400
                     ("60400" "TORO-RBT-Subscription-Configuration-Information" "Group")
                     437
                     ("437" "Requested-Service-Unit" "Group")
                     873
                     ("873" "Service-Information" "Group")
                     1228
                     ("1228" "SGSN-Address" "OctetString")
                     30
                     ("30" "Called-Station-Id" "OctetString")
                     865
                     ("865" "PS-Furnish-Charging-Information" "Group")
                     2
                     ("2" "GPP-Charging-Id" "OctetString")
                     866
                     ("866" "PS-Free-Format-Data" "OctetString")
                     60480
                     ("60480" "TORO-CDS-Session-Information" "Group")
                     60481
                     ("60481" "TORO-EventTypeCDS" "Unsigned32")
                     20341
                     ("20341" "Recharge-Information" "Group")
                     20344
                     ("20344" "Charge-Money" "Group")
                     20499
                     ("20499" "Alert-Level" "Unsigned32")
                     443
                     ("443" "Subscription-Id" "Group")
                     446
                     ("446" "Used-Serivce-Unit" "Group")
                     877
                     ("877" "MMS-Information" "Group")
                     1201
                     ("1201" "Recipient-Address" "Group")
                     899
                     ("899" "Address-Type" "Integer32")
                     897
                     ("897" "Address-Data" "OctetString")
                     886
                     ("886" "Originator-Address" "Group")
                     1212
                     ("1212" "Message-Size" "Unsigned32")
                     1209
                     ("1209" "Priority" "Integer32")
                     1210
                     ("1210" "Message-ID" "OctetString")
                     1211
                     ("1211" "Message-Type" "Integer32")
                     1101
                     ("1101" "VASP-Id" "OctetString")
                     1102
                     ("1102" "VAS-Id" "OctetString")
                     1202
                     ("1202" "Submission-Time" "OctetString")
                     20802
                     ("20802" "MSG-Seq" "OctetString")
                     284
                     ("284" "Proxy-Info" "Group")
                     458
                     ("458" "User-Equipment-Info" "Group")
                     445
                     ("445" "Unit-Value" "Group")
                     413
                     ("413" "CC-Money" "Group")
                     874
                     ("874" "PS-Information" "Group")
                     431
                     ("431" "Granted-Service-Unit" "Group")
                     457
                     ("457" "G-S-U-Pool-Reference" "Group")
                     434
                     ("434" "Redirect-Server" "Group")
                     430
                     ("430" "Final-Unit-Indication" "Group")
                     456
                     ("456" "Multiple-Services-Credit-Control" "Group")
                     423
                     ("423" "Cost-Information" "Group")
                     20356
                     ("20356" "AccountInfo" "Group")
                     20332
                     ("20332" "AoC-Tariff" "Group")
                     20329
                     ("20329" "AoC-Information" "Group")
                     20349
                     ("20349" "Account-Change-Info" "Group")
                     20394
                     ("20394" "Notice-Infomation" "Group")
                     30800
                     ("30800" "Auth-Information" "Group")
                     20300
                     ("20300" "IN-Information" "Group")
                     20400
                     ("20400" "P2PSMS-Information" "Group")
                     20500
                     ("20500" "MDSP-Information" "Group")
                     20511
                     ("20511" "OA-Subscription-Id" "Group")
                     20513
                     ("20513" "DA-Subscription-Id" "Group")
                     20503
                     ("20503" "Third-Party-Subscription-Id" "Group")
                     20600
                     ("20600" "RTBP-Information" "Group")
                     274
                     ("274" "ASR" "Group")
                     272
                     ("272" "CCR" "Group")))

;;; (avp-getline "avp-data.xml" t)
;;; (avp-getline "avp-data.xml")
;; --------------------------------------------------------------------------
;; below are used to convert avp data file
(defun avp-convert (bufname)
  (with-current-buffer bufname
    (goto-char (point-min))
    (let ((run 100)
          rt)
      (while (> run 0)
        (let ((end (line-end-position)))
          (let ((headerp (word-search-forward "Header" end t))
                (namep (word-search-forward "name=" end t))
                (name (thing-at-point 'symbol t))
                (codep (search-forward "code=\"" end t))
                (code (thing-at-point 'symbol t))
                (datatypep (word-search-forward " datatype=" end t))
                (datatype (thing-at-point 'word t)))
            (if (and headerp (equal code datatype))
                (setq datatype "Group"))
            (if (and namep codep code)
                (let* ((cc (string-to-number code 10))
                       (old (lax-plist-get rt cc)))
                  (if (or (not old) (and headerp (equal (nth 0 old) (nth 2 old))))
                      (setq rt (lax-plist-put rt cc (cons code (cons name (cons datatype nil))))))))))
        (forward-line 1)
        (if (= (point) (buffer-end 1))
            (setq run 0)
          (beginning-of-line)))
      rt)))

;; (avp-convert "avp-data.xml")

(defun avp-check ()
  (let ((end (line-end-position)))
    (let ((namep (word-search-forward "name=" end t))
          (name (thing-at-point 'symbol t))
          (codep (search-forward "code=\"" end t))
          (code (thing-at-point 'symbol t))
          (datatypep (word-search-forward " datatype=" end t))
          (datatype (thing-at-point 'word t)))
      (message "%S %S " name code))))
;; (string-to-number "code" 10)
;; (lax-plist-get avp-codelist "20802")


(provide 'avp-data)
