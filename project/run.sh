# Check if Dylan compiler is installed
if ! command -v dylan-compiler &> /dev/null; then
    echo "Dylan compiler is not installed. Install it first."
    exit 1
fi

# compile project

dylan-compiler -build project.dylan

# Run the whole thing

if [ -f "./build/bin/todo" ]; then
    ./build/bin/todo
else
    echo "Build failed: Executable not found."
    exit 1
fi
