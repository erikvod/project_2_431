## Installation and Initiallization of the Dylan Programming Language

#### Begin with installing and updating dependancies

- **1. Updates:**

  ```bash
  sudo apt update && sudo apt upgrade -y
  ```

- **2. Dependancies:**
  ```bash
  sudo apt install build-essential git libssl-dev
  ```

#### Install Open Dylan (may require different depending on os, works for wsl and should work for mac as well):

- **1. Download Open Dylan:**
  ```bash
  wget https://github.com/dylan-lang/opendylan/releases/download/v2023.1.0/opendylan-2024.1-x86_64-linux.tar.bz2
  ```
- **2. Extract and move Open Dylan:**

  ```bash
  tar -xf opendylan-2024.1-x86_64-linux.tar.bz2
  sudo mv opendylan-2024.1 /opt/opendylan
  ```

- **3. Add Open Dylan to path:**

    ```bash
    echo 'export PATH="/opt/opendylan/bin:$PATH"' >> ~/.bashrc
    ```
- **4. Reload bashrc:**
  ```bash
  source ~/.bashrc
  ```

- **5. Check installation and version**
        ```bash
        dylan-compiler -version
        ```

running it the todo application:
build: `dylan-compiler -build todo`
run the executable: `./build/bin/todo`

This proves to be erronious and could not be resolved. The build command does not recognize the files and does not produce and executable. The error persists when a dockerfile is used, when a makefile is used, and any other debugging methods are attempted. The example should have generated a simple terminal application that renders like so:

```bash
Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Enter task description: Write report
Task added: Write report (ID: 1)

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Enter task description: Submit assignment
Task added: Submit assignment (ID: 2)

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Current tasks:
ID: 1, Description: Write report, Status: Incomplete
ID: 2, Description: Submit assignment, Status: Incomplete

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Enter task ID to mark complete: 1
Task marked as complete: Write report (ID: 1)

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Current tasks:
ID: 1, Description: Write report, Status: Completed
ID: 2, Description: Submit assignment, Status: Incomplete

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Enter task ID to delete: 2
Task deleted: Submit assignment (ID: 2)

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

Current tasks:
ID: 1, Description: Write report, Status: Completed

Choose an option:
1. Add Task
2. Mark Task Complete
3. Delete Task
4. List Tasks
5. Exit

```