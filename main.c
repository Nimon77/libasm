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
#include <time.h>

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
void    ft_list_push_front(t_list **begin_list, void *data);
int     ft_list_size(t_list *begin_list);
void    ft_list_sort(t_list **begin_list, int(*cmp)());
void    ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(), void (*free_fct)(void *));

int ft_cmp_int(void *a, void *b)
{
    return *(int *)a - *(int *)b;
}

int ft_cmp_char(void *a, void *b)
{
    return (ft_strcmp((char *)a, (char *)b) > 0 ? 1 : 0);
}

void print_list_int(t_list *lst)
{
    t_list *next;

    next = NULL;
    printf("%d", *(int *)lst->data);
    next = lst->next;
    while (next != NULL)
    {
        printf(" -> %d", *(int *)next->data);
        next = next->next;
    }
}

void print_list_char(t_list *lst)
{
    t_list *next;

    next = NULL;
    printf("%s", (char *)lst->data);
    next = lst->next;
    while (next != NULL)
    {
        printf(" -> %s", (char *)next->data);
        next = next->next;
    }
}

int gen_random()
{
    static int first = 0;
    int max = 10000;
    int min = -10000;
   
    if (first == 0)
    {
        srand(time(NULL));
        first = 1;
    }
    return ((random() % (max + 1 - min)) + min);
}

int main()
{
    char    *str[2];
    char    *ret = NULL;
    char    *cmp = "teSt";
    char    cmp2[] = "teSt";
    char    buf[256];
    ssize_t retval;
    t_list  *lst[2];

    str[0] = ft_strdup("test");
    str[1] = ft_strdup("blabla");

    printf("ft_strlen :\n%d\n\n", ft_strlen(str[0]));

    ret = ft_strcpy(str[0], str[1]);
    printf("ft_strcpy :\n%p = %p\n%s\n\n", str[1], ret, str[1]);

    printf("ft_strcmp :\n%d = %d\n", ft_strcmp(cmp, cmp2), strcmp(cmp, cmp2));

    ft_write(1, "\nft_write :\ntest\n", ft_strlen("\nft_write :\ntest\n"));
    ft_write(1, "\n", 1);
    retval = 0;

    ft_write(1, "ft_read ? ", 10);
    retval = ft_read(0, &buf, 256);
    ft_write(1, &buf, ft_strlen(buf));
    printf("%zd\n\n", retval);

    printf("ft_atoi_base :\n");
    printf("%d\n\n", ft_atoi_base(" \t\n\r-++++++-+--ff\xff", "0123456789abcdef"));

    printf("ft_lst_push_front :\n");
    lst[0] = NULL;
    lst[1] = NULL;
    int lst_data[5];
    lst_data[0] = gen_random();
    lst_data[1] = gen_random();
    lst_data[2] = gen_random();
    lst_data[3] = gen_random();
    lst_data[4] = 42;
    ft_list_push_front(&lst[0], &lst_data[0]);
    ft_list_push_front(&lst[0], &lst_data[1]);
    ft_list_push_front(&lst[0], &lst_data[2]);
    ft_list_push_front(&lst[0], &lst_data[3]);
    ft_list_push_front(&lst[0], &lst_data[4]);
    printf("(int)  ");
    print_list_int(lst[0]);
    printf("\n");
    ft_list_push_front(&lst[1], ft_strdup("start"));
    ft_list_push_front(&lst[1], ft_strdup("blabla"));
    ft_list_push_front(&lst[1], ft_strdup("front88"));
    ft_list_push_front(&lst[1], ft_strdup("front88"));
    ft_list_push_front(&lst[1], ft_strdup("front4"));
    ft_list_push_front(&lst[1], ft_strdup("front5"));
    printf("(char *)  ");
    print_list_char(lst[1]);
    printf("\n\n");

    printf("ft_lst_size :\n");
    printf("(int) = %d\n(char *) = %d\n\n", ft_list_size(lst[0]), ft_list_size(lst[1]));

    printf("ft_list_sort :\n");
    ft_list_sort(NULL, NULL);
    ft_list_sort(NULL, ft_cmp_int);
    ft_list_sort(&lst[0], NULL);
    ft_list_sort(&lst[0], ft_cmp_int);
    printf("(int)  ");
    print_list_int(lst[0]);
    printf("\n");
    ft_list_sort(&lst[1], ft_cmp_char);
    printf("(char *)  ");
    print_list_char(lst[1]);
    printf("\n");
    return 0;
}
