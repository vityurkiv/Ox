import re
import os
from markdown.util import etree
import logging
log = logging.getLogger(__name__)

import MooseDocs
from markdown.inlinepatterns import Pattern
from MooseCommonExtension import MooseCommonExtension
import utils

class MoosePackageParser(MooseCommonExtension, Pattern):
  """
  Markdown extension for extracting package arch and version.
  """

  RE = r'!MOOSEPACKAGE\s*(.*?)!'

  def __init__(self, markdown_instance=None, **kwargs):
    MooseCommonExtension.__init__(self, **kwargs)
    Pattern.__init__(self, self.RE, markdown_instance)

    # Load the yaml data containing package information
    self.package = MooseDocs.yaml_load("packages.yml")

    # The default settings
    self._settings = {'arch' : None,
             'return' : None}

  def handleMatch(self, match):
    """
    Returns a tree element containing error message.

    Uses the html to match the python markdown admonition package.
    https://pythonhosted.org/Markdown/extensions/admonition.html

    <div class="admonition danger">
    <p class="admonition-title">Don't try this at home</p>
    <p>...</p>
    </div>
    """
    # Update the settings from regex match
    settings, styles = self.getSettings(match.group(2))
    if not settings.has_key('arch') or not settings.has_key('return'):
      el = self.createErrorElement('Invalid MOOSEPACKAGE markdown syntax. Requires arch=, return=link|name')
    else:
      if settings['arch'] not in self.package.keys():
        el = self.createErrorElement('"arch" not found in packages.yml')
      else:
        if settings['return'] == 'link':
          el = etree.Element('a')
          el.set('href', self.package['link'] + self.package[settings['arch']]['name'])
          el.text = self.package[settings['arch']]['name']
        elif settings['return'] == 'name':
          el = etree.Element('p')
          el.text = self.package[settings['arch']]['name']
    return el
