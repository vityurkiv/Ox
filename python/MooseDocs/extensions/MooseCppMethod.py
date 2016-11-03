import re
import os
from markdown.util import etree
import logging
log = logging.getLogger(__name__)

import MooseDocs
from MooseTextPatternBase import MooseTextPatternBase
import utils

try:
  import utils.MooseSourceParser
  HAVE_MOOSE_CPP_PARSER = True
except:
  HAVE_MOOSE_CPP_PARSER = False


class MooseCppMethod(MooseTextPatternBase):
  """
  A markdown extension for including source code files.
  """

  # REGEX for finding: !clang /path/to/file.C|h method=some_method
  CPP_RE = r'^!clang\s+(.*?)(?:$|\s+)(.*)'

  def __init__(self, make=None, **kwargs):
    super(MooseCppMethod, self).__init__(self.CPP_RE, language='cpp', **kwargs)

    # The make command to execute
    self._make = make

  def handleMatch(self, match):
    """
    Process the C++ file provided.
    """
    # Update the settings from regex match
    settings, styles = self.getSettings(match.group(3))

    # Extract relative filename
    rel_filename = match.group(2).lstrip('/')

    # Error if the clang parser did not load
    if not HAVE_MOOSE_CPP_PARSER:
      log.error("Unable to load the MOOSE clang C++ parser.")
      el = self.createErrorElement("Failed to load python clang python bindings.")
      return el

    # Read the file and create element
    filename = os.path.join(self._root, rel_filename)
    if not os.path.exists(filename):
      el = self.createErrorElement("C++ file not found: {}".format(rel_filename))
    elif not settings.has_key('method'):
      el = self.createErrorElement("Use of !clang syntax while not providing a method=some_method. If you wish to include the entire file, use !text instead.")
    else:
      if self._make == None:
        el = self.createErrorElement("The location of the Makefile ({}) must be supplied to parser.".format(self._make))
      else:
        log.info('Parsing method "{}" from {}'.format(settings['method'], filename))

        try:
          parser = utils.MooseSourceParser(self._make)
          parser.parse(filename)
          decl, defn = parser.method(settings['method'])
          el = self.createElement(match.group(2), defn, filename, rel_filename, settings, styles)
        except:
          el = self.createErrorElement('Failed to parse method using clang, check that you have the make file option passed to the MooseMarkdown object.')

    # Return the Element object
    return el
