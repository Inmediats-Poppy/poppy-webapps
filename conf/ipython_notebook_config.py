# Configuration file for ipython-notebook.
c = get_config()

# The number of additional ports to try if the specified port is not available.
c.NotebookApp.port_retries = 50

# The IP address the notebook server will listen on.
c.NotebookApp.ip = '*'

# Whether to open in a browser after starting.
c.NotebookApp.open_browser = False

# The port the notebook server will listen on.
c.NotebookApp.port = 8888
