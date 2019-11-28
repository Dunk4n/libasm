
extern _op
global _ft_list_remove_if

; void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *))
; rdi begin_list
; rsi data_ref
; rdx cmp
; rcx free_fct
_ft_list_remove_if:
	cmp rdi, 0
	jz ft_list_remove_if_error
	cmp qword [rdi], 0
	jz ft_list_remove_if_error
	cmp rdx, 0
	jz ft_list_remove_if_error
	cmp rcx, 0
	jz ft_list_remove_if_error

	push rbx

ft_list_remove_if_while:
ft_list_remove_if_while_end:

	pop rbx
	ret

ft_list_remove_if_error:
	call _op
	ret
