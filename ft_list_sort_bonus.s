global _ft_list_sort

; void	ft_list_sort(t_list **begin_list, int (*cmp)());
_ft_list_sort:
	cmp 	rsi, 0 ; ret if arg2 is NULL
	je		end
	mov		r11, [rdi] ; r11 = *begin
	cmp 	r11, 0 ; if *begin == NULL return
	je		end
	mov		r12, rsi; mov arg2 in r12
	mov		r13, [r11 + 8] ; ptr = ptr->next
	jmp		loop
loop:
	cmp 	r13, 0 ; if ptr == NULL begin = begin->next
	je		inc
	mov		rdi, [r11] ; rdi = begin->data
	mov		rsi, [r13] ; rsi = ptr->data
	call	r12 ; call *cmp
	cmp		rax, 0 ; if ret > 0 then swap
	jg		swap
	jmp		inc2 ; ptr = ptr->next
inc:
	mov		r11, [r11 + 8]
	cmp 	r11, 0
	je		end
	mov		r13, [r11 + 8] ; ptr = ptr->next
	jmp		loop
inc2:
	mov		r13, [r13 + 8]
	jmp		loop
swap:
	mov		r8, [r11]
	mov		r9, [r13]
	mov		[r11], r9
	mov		[r13], r8
	jmp		inc2
end:
	ret

; void		*ft_sort_list(t_list **lst, int (*cmp)(int, int))
; {
; 	t_list		*begin;
; 	t_list		*ptr;
; 	int			temp;
;
; 	temp = 0;
; 	begin = lst;
; 	while (lst)
; 	{
; 		ptr = lst->next;
; 		while (ptr)
; 		{
; 			if ((*cmp)(ptr->data, lst->data))
; 			{
; 				temp = lst->data;
; 				lst->data = ptr->data;
; 				ptr->data = temp;
; 			}
; 			ptr = ptr->next;
; 		}
; 		lst = lst->next;
; 	}
; 	return (begin);
; }
