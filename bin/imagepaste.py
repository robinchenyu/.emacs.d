import os
import sys
try:
	from PIL import ImageGrab
	from PIL import ImageFile
except ImportError:
	sys.path.append(os.path.dirname(__file__))
	from PIL import ImageGrab
	from PIL import ImageFile

def mkdir_safe(filename):
	dir_name = os.path.dirname(filename)
	if not os.path.exists(dir_name):
		os.mkdir(dir_name)

def paste(file_name):
	ImageFile.LOAD_TRUNCATED_IMAGES = True
	fullname = file_name
	im = ImageGrab.grabclipboard()
	if im:
		mkdir_safe(file_name)
		ret = im.save(fullname,'jpeg')
		return "%s" % (fullname)
	else:
		print('clipboard buffer is not image!')
		return None


if __name__ == '__main__':
	if paste(sys.argv[1]) is None:
		sys.exit(1)
	sys.exit(0)
