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

typedef struct      s_list
{
    void            *data;
    struct s_list   *next;
    
}                   t_list;


int     ft_strlen(char *str);
int     ft_strcmp(const char *s1, const char *s2);
char    *ft_strcpy(char *dst, const char *src);
ssize_t ft_write(int fildes, const void *buf, size_t nbyte);
ssize_t ft_read(int fildes, void *buf, size_t nbyte);
char    *ft_strdup(const char *s1);
int     ft_atoi_base(const char *str, const char *base);
void    ft_list_push_front(t_list **alst, t_list *new);
int     ft_list_size(t_list *lst);

int main()
{
    int     ret3;
    char    *str[2];
    char    *ret = NULL;
    char    *cmp = "teSt";
    char    cmp2[] = "teSt";
    char    buf[256];
    ssize_t retval;
    t_list  *lst1;
    t_list  *lst2;
    t_list  *lst3;

    str[0] = ft_strdup("test");
    str[1] = ft_strdup("blabla");
    ret = ft_strcpy(str[1], cmp);

    printf("ft_strlen :\n%d\n\n", ft_strlen(str[0]));
    printf("ft_strcpy :\n%p = %p\n%s\n\n", str[1], ret, str[1]);
    printf("ft_strcmp :\n%d = %d\n", ft_strcmp(cmp, cmp2), strcmp(cmp, cmp2));
    ft_write(1, "\nft_write :\ntest\n", ft_strlen("\nft_write :\ntest\n"));
    ft_write(1, "\n", 1);
    retval = 0;
    retval = ft_read(0, &buf, 256);
    ft_write(1, &buf, ft_strlen(buf));
    printf("%zd\n\n", retval);

    ret3 = ft_atoi_base("     -2147483647", "012345678");
    printf("%d\n", ret3);
    ret3 = atoi("     -2147483647");
    printf("%d\n", ret3);

    lst1 = malloc(sizeof(*lst1));
    lst1->data = ft_strdup("lst1");
    lst1->next = NULL;
    lst2 = malloc(sizeof(*lst2));
    lst2->data = ft_strdup("lst2");
    lst2->next = NULL;
    lst3 = malloc(sizeof(*lst3));
    lst3->data = ft_strdup("lst3");
    lst3->next = NULL;
    printf("\n%ld\t%ld\n", sizeof(void *), sizeof(t_list));
    printf("\n%s, %s, %s\n", (char *)lst1->data, (char *)lst2->data, (char *)lst3->data);
    ft_list_push_front(&lst1, lst2);
    ft_list_push_front(&lst1, lst3);
    printf("%s -> %s -> %s\n", (char *)lst1->data, (char *)lst1->next->data, (char *)lst1->next->next->data);
    printf("size : %d\n", ft_list_size(lst1));
    return 0;
}
