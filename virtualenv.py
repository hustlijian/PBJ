import os, sys

os.system("virtualenv env")

# activate virtualenv
activate_this = os.path.expanduser("env/bin/activate_this.py")
execfile(activate_this, dict(__file__=activate_this))

from setuptools.command import easy_install

easy_install.main( ["-U","flask"] )