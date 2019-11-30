/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niduches <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/26 08:58:51 by niduches          #+#    #+#             */
/*   Updated: 2019/11/30 16:35:02 by niduches         ###   ########.fr       */
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
void	*ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref,
int (*cmp)(), void (*free_fct)(void *));

void	bonus(void)
{
	t_list	*a;
	a = NULL;

//	ft_list_push_front(NULL, strdup("5"));
//	printf("%s %p, %p, %p\n", a->data, a, a->data, a->next);
//	ft_list_push_front(&a, strdup("4"));
//	printf("%s %p, %p\n", a->data, a, a->data);
//	ft_list_push_front(&a, strdup("1"));
//	printf("%s %p, %p\n", a->data, a, a->data);
//	ft_list_push_front(&a, strdup("2"));
//	printf("%s %p, %p\n", a->data, a, a->data);
//	ft_list_push_front(&a, NULL/*strdup("3")*/);
//	printf("%s %p, %p\n\n", a->data, a, a->data);

//	int i = ft_list_size(a);
//printf("B%p, %lld, %lld\n", ptr, (unsigned long long)ptr, (unsigned long long)ptr % 16);
	while (a)
	{
		printf("data = %s\n", a->data);
		a = a->next;
	}
}

int		main(int ac, char **av)
{
	if (ac != 2)
		return (1);
	if (!strcmp(av[1], "ft_strlen") || !strcmp(av[1], "all"))
	{
		printf("ft_strlen:\n");
		printf("[%s] -> %d\n", "", ft_strlen(""));
		printf("[%s] -> %d\n", "abc", ft_strlen("abc"));
		printf("[%s] -> %d\n", "abcdefghijklmnopqrstuvwxyz", ft_strlen("abcdefghijklmnopqrstuvwxyz"));
	}
	if (!strcmp(av[1], "ft_strcpy") || !strcmp(av[1], "all"))
	{
		char a[50] = "ABC";
		char b[50] = "abc";

		printf("\nft_strcpy:\n");
		printf("source [%s], dest [%s]\n", a, b);
		printf("before [%s]", b);
		printf(", after [%s]\n", ft_strcpy(b, a));
		strcpy(a, "0123456789");
		strcpy(b, "");
		printf("\nsource [%s], dest [%s]\n", a, b);
		printf("before [%s]", b);
		printf(", after [%s]\n", ft_strcpy(b, a));
		strcpy(a, "012");
		strcpy(b, "abcdefghijklmnopqrstuvwxyz");
		printf("\nsource [%s], dest [%s]\n", a, b);
		printf("before [%s]", b);
		printf(", after [%s]\n", ft_strcpy(b, a));
	}
	if (!strcmp(av[1], "ft_strcmp") || !strcmp(av[1], "all"))
	{
		char a[50] = "abc";
		char b[50] = "ABC";
		
		printf("\nft_strcmp:\n");
		printf("[%s], [%s], %d\n", a, b, ft_strcmp(a, b));
		strcpy(a, "0123456789");
		strcpy(b, "0123456789");
		printf("[%s], [%s], %d\n", a, b, ft_strcmp(a, b));
	}
	if (ac > 1 && strcmp(av[1], "bonus"))
		bonus();
	return (0);
}
