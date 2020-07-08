/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: nsimon <nsimon@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/06/29 18:18:45 by nsimon            #+#    #+#             */
/*   Updated: 2020/06/29 19:55:25 by nsimon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <malloc/malloc.h>

int     ft_strlen(char *str);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strcpy(char *dst, const char *src);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
char    *ft_strdup(const char *s1);
int     ft_atoi_base(const char *str, const char *base);

int main()
{
    //char    *str[2];
    //char    *ret = NULL;
    //char    *cmp = "teSt";
    //char    cmp2[] = "teSt";
    //char    buf[256];
    //ssize_t retval;

    //str[0] = ft_strdup("test");
    //str[1] = ft_strdup("blabla");
    //ret = ft_strcpy(str[1], cmp);

    //printf("ft_strlen :\n%d\n\n", ft_strlen(str[0]));
    //printf("ft_strcpy :\n%p = %p\n%s\n\n", str[1], ret, str[1]);
    //printf("ft_strcmp :\n%d = %d\n", ft_strcmp(cmp, cmp2), strcmp(cmp, cmp2));
    //ft_write(1, "\nft_write :\ntest\n", ft_strlen("\nft_write :\ntest\n"));
    //ft_write(1, "\n", 1);
    //retval = 0;
    //retval = ft_read(0, &buf, 256);
    //ft_write(1, &buf, ft_strlen(buf));
    //printf("\n%zd\n", retval);

    int     ret3;

    ret3 = ft_atoi_base("     2147483647", "0123456789");
    printf("%d\n", ret3);
    ret3 = atoi("     2147483647");
    printf("%d\n", ret3);
    return 0;
}
