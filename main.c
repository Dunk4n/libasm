/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niduches <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/26 08:58:51 by niduches          #+#    #+#             */
/*   Updated: 2019/11/27 21:53:06 by niduches         ###   ########.fr       */
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
int		test(void);
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

void	op(void)
{
	printf("11111111111111111\n");
}

int	oui(const char *a, const char *b)
{
	int i = 0;

	printf("AAAAAAAAAAAAAA\n");
	printf("%p, %p\n", a, b);
	i = strcmp(a, b);
	printf("BBBBBBBBBBBB\n");
	return (0);
}

int		main(int ac, char **av)
{
	(void)ac;
	(void)av;
	t_list	*a;
	a = NULL;

	ft_list_push_front(&a, strdup("5"));
	ft_list_push_front(&a, strdup("1"));
	ft_list_push_front(&a, strdup("3"));
	ft_list_push_front(&a, strdup("2"));
	ft_list_push_front(&a, strdup("4"));

	printf("A\n");
	ft_list_sort(&a, &oui);
	printf("B\n");
	while (a)
	{
		printf("data = %s\n", a->data);
		a = a->next;
	}
	return (0);
}
