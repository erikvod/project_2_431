//Examples of Dylan code


// Defining a linked list

        define class <node>
        slot value :: <integer>;
        slot next :: (<node> | #f);  // Next node or false (end of list)
        end class;

        define method add-node(list, value)
        let new-node = make(<node>, value: value, next: list);
        new-node;
        end method;

        define method print-list(list)
        while (list /= #f) do
            format-out("~d ", list.value);
            list := list.next;
        end while;
        end method;

        // Usage
        let list = make(<node>, value: 1, next: #f);
        list := add-node(list, 2);
        list := add-node(list, 3);
        print-list(list);  // Outputs: 3 2 1



// Concurrency with threads

        define thread-safe
        let lock = make(<lock>);
        let counter = 0;

        define method increment-counter()
            lock(lock);
            counter := counter + 1;
            unlock(lock);
        end method;

        define method concurrent-task()
            for (i from 1 to 100) do
            increment-counter();
            end for;
        end method;

        thread(do(concurrent-task()));
        thread(do(concurrent-task()));
        thread(do(concurrent-task()));

        format-out("Final counter value: ~d", counter);
        end define;



// Map, Reduce, Filter

        define method demonstrate-map-reduce-filter()
        let numbers = #(1, 2, 3, 4, 5);

        // Map: Square each number
        let squared = map(lambda(x) x * x, numbers);

        // Filter: Keep only even numbers
        let evens = filter(lambda(x) x mod 2 = 0, squared);

        // Reduce: Sum the even numbers
        let sum-of-evens = reduce(lambda(x, y) x + y, evens);

        format-out("Squared: ~s\nEvens: ~s\nSum of Evens: ~d", squared, evens, sum-of-evens);
        end method;

        // Call it
        demonstrate-map-reduce-filter();



// Tail Recursion

        define method factorial(n, acc :: <integer> = 1) => <integer>
        if n = 0 then
            acc;
        else
            factorial(n - 1, acc * n);
        end if;
        end method;

        // Usage
        format-out("Factorial of 5: ~d", factorial(5));  // Outputs: 120
