module: todo;

//class
define class <Task>
  slot id :: <integer>;
  slot description :: <string>;
  slot completed? :: <boolean>;
end class;

//variables
define variable tasks :: <list> = [];
define variable next-id :: <integer> = 1;

//add
define method add-task(description :: <string>)
  let new-task = make(<Task>, id: next-id, description: description, completed?: #f);
  add-element(new-task, tasks);
  next-id := next-id + 1;
  format-out("Task added: ~s (ID: ~d)~%", description, new-task.id);
end method;
//mod
define method mark-task-complete(task-id :: <integer>)
  let task = find-if(#[t | t.id = task-id], tasks);
  if (task)
    task.completed? := #t;
    format-out("Task marked as complete: ~s (ID: ~d)~%", task.description, task.id);
  else
    format-out("Task with ID ~d not found.~%", task-id);
  end;
end method;

//delete
define method delete-task(task-id :: <integer>)
  let task = find-if(#[t | t.id = task-id], tasks);
  if (task)
    remove-element(task, tasks);
    format-out("Task deleted: ~s (ID: ~d)~%", task.description, task.id);
  else
    format-out("Task with ID ~d not found.~%", task-id);
  end;
end method;

//show all
define method list-tasks()
  if (empty?(tasks))
    format-out("No tasks available.~%");
  else
    format-out("Current tasks:~%");
    for (task in tasks)
      format-out("ID: ~d, Description: ~s, Status: ~s~%",
                 task.id, task.description,
                 if (task.completed?) "Completed" else "Incomplete");
    end;
  end;
end method;

//menu
define method show-menu()
  format-out("Choose an option:~%");
  format-out("1. Add Task~%");
  format-out("2. Mark Task Complete~%");
  format-out("3. Delete Task~%");
  format-out("4. List Tasks~%");
  format-out("5. Exit~%");
end method;

//general structure
define method main()
  let continue? = #t;
  while (continue?)
    show-menu();
    let choice = read();
    case choice
      1 => begin
        format-out("Enter task description: ");
        let description = read();
        add-task(description);
      end;
      2 => begin
        format-out("Enter task ID to mark complete: ");
        let task-id = read();
        mark-task-complete(task-id);
      end;
      3 => begin
        format-out("Enter task ID to delete: ");
        let task-id = read();
        delete-task(task-id);
      end;
      4 => list-tasks();
      5 => continue? := #f;
      else format-out("Invalid choice. Try again.~%");
    end;
  end;
end method;

main();
