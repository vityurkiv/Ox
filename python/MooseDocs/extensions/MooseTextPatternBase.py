import re
import os
import logging
import copy
log = logging.getLogger(__name__)

from markdown.inlinepatterns import Pattern
from markdown.util import etree
from MooseCommonExtension import MooseCommonExtension
import MooseDocs

class MooseTextPatternBase(MooseCommonExtension, Pattern):
  """
  Base class for pattern matching text blocks.

  Args:
    regex: The string containing the regular expression to match.
    language[str]: The code language (e.g., 'python' or 'c++')
  """

  def __init__(self, pattern, markdown_instance=None, repo=None, **kwargs):
    MooseCommonExtension.__init__(self, **kwargs)
    Pattern.__init__(self, pattern, markdown_instance)

    # The root/repo settings
    self._repo = repo

    # The default settings
    self._settings = {'strip_header'        : True,
             'repo_link'           : True,
             'label'               : True,
             'method'              : True,
             'language'            : 'text',
             'block'               : True,
             'strip-extra-newlines': False}

    # Applying overflow/max-height CSS to <div> and <code> causes multiple scroll bars
    # do not let code float, the div will do this for us
    self._invalid_css = { 'div' : ['overflow-y', 'overflow-x', 'max-height'], 'code' : ['float'] }

  def prepareContent(self, content, settings):
    """
    Prepare the convent for conversion to Element object.

    Args:
      content[str]: The content to prepare (i.e., the file contents).
    """

    # Strip leading/trailing newlines
    content = re.sub(r'^(\n*)', '', content)
    content = re.sub(r'(\n*)$', '', content)

    # Strip extra new lines (optional)
    if settings['strip-extra-newlines']:
      content = re.sub(r'(\n{3,})', '\n\n', content)

    # Strip header and leading/trailing whitespace and newlines
    if self._settings['strip_header']:
      strt = content.find('/********')
      stop = content.rfind('*******/\n')
      content = content.replace(content[strt:stop+9], '')

    return content

  def createElement(self, label, content, filename, rel_filename, settings, styles):
    """
    Create the code element from the supplied source code content.

    Args:
      label[str]: The label supplied in the regex, [label](...)
      content[str]: The code content to insert into the markdown.
      filename[str]: The complete filename (for error checking)
      rel_filename[str]: The relative filename; used for creating github link.
      settings[dict]: The current settings.

    NOTE: The code related settings and clean up are applied in this method.
    """

    # Strip extra new lines
    content = self.prepareContent(content, settings)

    # Build outer div container
    el = self.addStyle(etree.Element('div'), **styles)
    el.set('class', 'moosedocs-code-div')

    # Build label
    if settings['repo_link'] and self._repo:
      title = etree.SubElement(el, 'a')
      title.set('href', os.path.join(self._repo, rel_filename))
    else:
      title = etree.SubElement(el, 'div')

    if settings['label']:
      title.text = label

    # Build the code
    pre = etree.SubElement(el, 'pre')
    code = self.addStyle(etree.SubElement(pre, 'code'), **styles)
    if settings['language']:
      code.set('class', 'hljs ' + settings['language'])
    code.text = content

    return el
