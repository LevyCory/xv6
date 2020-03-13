.intel_syntax noprefix
.text


/* Switch from current_thread to next_thread. Make next_thread
 * the current_thread, and set next_thread to 0.
 * Use eax as a temporary register; it is caller saved.
 */

.globl thread_switch
thread_switch:
    mov eax, current_thread

    /* Save current_thread's state */
    pushad
    mov [eax], esp

    /* Set current_thread to point at next_thread */
    mov eax, next_thread
    mov current_thread, eax
    mov dword ptr next_thread, 0

    /* Restore next_thread's state */
    mov esp, [eax]
    popad

    ret
