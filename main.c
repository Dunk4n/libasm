/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: niduches <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/11/26 08:58:51 by niduches          #+#    #+#             */
/*   Updated: 2019/11/27 14:59:09 by niduches         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int		ft_strlen(char *str);
int		test(void);
char	*ft_strcpy(char *dst, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
int		ft_atoi_base(char *str, char *base);

int		main(int ac, char **av)
{
	if (ac < 3)
		return (0);
	printf("%d\n", ft_atoi_base(av[1], av[2]));
	return (0);
}
