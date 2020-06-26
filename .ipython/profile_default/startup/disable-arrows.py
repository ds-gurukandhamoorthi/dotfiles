from IPython import get_ipython
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.keys import Keys
from prompt_toolkit.filters import HasFocus, HasSelection, ViInsertMode, EmacsInsertMode

ip = get_ipython()
insert_mode = ViInsertMode() | EmacsInsertMode()

def do_nothing(event):
    pass

# Register the shortcut if IPython is using prompt_toolkit
if getattr(ip, 'pt_app', None):
    registry = ip.pt_app.key_bindings
    registry.add_binding(Keys.Left,
            filter=(HasFocus(DEFAULT_BUFFER)
                & ~HasSelection()
                & insert_mode))(do_nothing)

    registry.add_binding(Keys.Right,
            filter=(HasFocus(DEFAULT_BUFFER)
                & ~HasSelection()
                & insert_mode))(do_nothing)

    registry.add_binding(Keys.Up,
            filter=(HasFocus(DEFAULT_BUFFER)
                & ~HasSelection()
                & insert_mode))(do_nothing)

    registry.add_binding(Keys.Down,
            filter=(HasFocus(DEFAULT_BUFFER)
                & ~HasSelection()
                & insert_mode))(do_nothing)
