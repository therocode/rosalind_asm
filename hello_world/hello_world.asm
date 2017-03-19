; Writes "Hello, World" to the console using system call.

        global  _start                  ; mark _start as identifier to make visible for linker. _start is the default entry point that the linker will use

        section .text                   ; says that the following section is code
_start:                                 
                                        ; mov copies the second parameter into the register given by the first parameter
        mov     rax, 1                  ; system call 1 is write
        mov     rdi, 1                  ; file handle 1 is stdout
        mov     rsi, message            ; address of string to output
        mov     rdx, 12                 ; number of bytes
        syscall                         ; invoke operating system to do the write. This uses the values placed in the above registers as parameters

        mov     eax, 60                 ; system call 60 is exit
        xor     rdi, rdi                ; by xoring rdi with itself, we make sure that that register is 0. This is used as exit code
        syscall                         ; invoke operating system to exit
message:
                                        ; db declares this as data
        db      "Hello world", 10       ; note the newline at the end
