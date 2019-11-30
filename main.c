/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niduches <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/26 08:58:51 by niduches          #+#    #+#             */
/*   Updated: 2019/11/30 20:31:11 by niduches         ###   ########.fr       */
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

void	display_lst(t_list *a)
{
	printf("list:\n");
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
	if (!strncmp(av[1], "ft_strlen", ft_strlen("ft_strlen")) || !strcmp(av[1], "all"))
	{
		printf("ft_strlen:\n");
		printf("[%s] -> %d\n", "", ft_strlen(""));
		printf("[%s] -> %d\n", "abc", ft_strlen("abc"));
		printf("[%s] -> %d\n", "abcdefghijklmnopqrstuvwxyz", ft_strlen("abcdefghijklmnopqrstuvwxyz"));
	}
	if (!strncmp(av[1], "ft_strcpy", strlen("ft_strcpy")) || !strcmp(av[1], "all"))
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
	if (!strncmp(av[1], "ft_strcmp", strlen("ft_strcmp")) || !strcmp(av[1], "all"))
	{
		char a[50] = "a";
		char b[50] = "ab";
		
		printf("\nft_strcmp:\n");
		printf("[%s], [%s], %d | ft_strcmp\n", a, b, ft_strcmp(a, b));
		printf("[%s], [%s], %d | strcmp\n", a, b, strcmp(a, b));
		strcpy(a, "0123456789");
		strcpy(b, "0123456789");
		printf("[%s], [%s], %d | ft_strcmp\n", a, b, ft_strcmp(a, b));
		printf("[%s], [%s], %d | strcmp\n", a, b, strcmp(a, b));
	}
	if (!strncmp(av[1], "ft_write", strlen("ft_write")) || !strcmp(av[1], "all"))
	{
		printf("\nft_write:\n");
		printf("| -> %zd\n", ft_write(1, "abc", 3));
		printf("| -> %zd\n", ft_write(1, "0123456789", 5));
	}
	if (!strncmp(av[1], "ft_read", strlen("ft_read")) || !strcmp(av[1], "all"))
	{
		static char buff[50];

		printf("\nft_read:\n");
		printf("-> %zd, %s\n", ft_read(1, buff, 3), buff);
	}
	if (!strncmp(av[1], "ft_strdup", strlen("ft_strdup")) || !strcmp(av[1], "all"))
	{
		char *str = "abc";
		char *tmp;
		printf("\nft_strdup:\n");
		tmp = ft_strdup(str);
		printf("[%s] -> [%s]\n", str, tmp);
		free(tmp);
	}
	if (!strncmp(av[1], "ft_atoi_base", strlen("ft_atoi_base")) || !strcmp(av[1], "all"))
	{
		printf("\nft_atoi_base:\n");
		printf("nb: [%s], base: %s\n", "fff", "0123456789abcdef");
		printf("-> %d\n", ft_atoi_base("fff", "0123456789abcdef"));
		printf("nb: [%s], base: %s\n", "413", "314");
		printf("-> %d\n", ft_atoi_base("413", "314"));
	}
	if (!strncmp(av[1], "bonus", strlen("bonus")) || !strcmp(av[1], "all"))
	{
		t_list *a = NULL;
		printf("\nft_list_push_front:\n");
		ft_list_push_front(&a, ft_strdup("1"));
		ft_list_push_front(&a, ft_strdup("3"));
		ft_list_push_front(&a, ft_strdup("2"));
		display_lst(a);
		printf("\nft_list_size:\nlist size = %d\n", ft_list_size(a));
		ft_list_sort(&a, &strcmp);
		printf("\nft_list_sort:\n");
		display_lst(a);
		printf("\nft_list_remove_if:\n");
		printf("rm 2\n");
		ft_list_remove_if(&a, "2", &strcmp, &free);
		display_lst(a);
		ft_list_remove_if(&a, "1", &strcmp, &free);
		ft_list_remove_if(&a, "3", &strcmp, &free);
	}
	return (0);
}
