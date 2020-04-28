.vim - Personal VIM Configuration
=================================

This is a living repository for my current VIM configuration. Contents are subject to change erratically.

Reminders
---------

- Read `this guide`_ for a summary of how to track vim plugins in vcs

- To install the ``author/foo.vim`` plugin:
    .. code-block:: shell
        
        $ git submodule add https://github.com/author/foo.git pack/plugins/start/foo

- To clone to a new machine:
    .. code-block:: shell
        
       $ git clone --recursive https://github.com/blueschu/.vim.git
    
    - If desired, install `fzf`_! Note that if ``fzf`` is not installed, this plugin will still be loaded, but all mappings will fail if used.
    - If desired, install `YouCompleteMe`_. Note that this plugin will not be added unless ycm has been installed.

.. _This guide: https://gist.github.com/manasthakur/d4dc9a610884c60d944a4dd97f0b3560
.. _fzf: https://github.com/junegunn/fzf
.. _YouCompleteMe: https://github.com/ycm-core/YouCompleteMe
