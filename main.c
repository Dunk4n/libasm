/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niduches <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/26 08:58:51 by niduches          #+#    #+#             */
/*   Updated: 2019/11/29 11:57:17 by niduches         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

int		ft_strlen(char *str);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
char	*ft_strdup(const char *str);
int		ft_atoi_base(char *str, char *base);

t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	*ft_list_remove_if(t_list **begin_list, void *data_ref,
int (*cmp)(), void (*free_fct)(void *));

int hh = 0;
void	op(void)
{
	printf("op\n");
}

void	free_moi(void)
{
	puts("op\n");
	//printf("%p\n", ptr);
	//free(ptr);
	//printf("%p\n", ptr);
}

void	*test(void *ptr);
int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
	t_list	*a;
	a = NULL;

//	void *ptrr = strdup("abc");
//	test(ptrr);
//	return (0);
	ft_list_push_front(&a, strdup("1"));
	printf("5 %p, %p\n", a, a->data);
	ft_list_push_front(&a, strdup("1"));
	printf("1 %p, %p\n", a, a->data);
	ft_list_push_front(&a, strdup("a"));
	printf("3 %p, %p\n", a, a->data);
	ft_list_push_front(&a, strdup("1"));
	printf("2 %p, %p\n", a, a->data);
	ft_list_push_front(&a, strdup("a"));
	printf("4 %p, %p\n\n", a, a->data);

	printf("A, %p, %p, %p\n\n", &a, &strcmp, &free);
	void *ptr;
	ptr = ft_list_remove_if(&a, "a", &strcmp, &free);
	printf("B\n");
	printf("%llu, %llu\n", (unsigned long long)ptr, (unsigned long long)ptr % 16);
	while (a)
	{
		printf("data = %s\n", a->data);
		a = a->next;
	}
	return (0);
}
