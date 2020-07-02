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

int ft_strlen(char *str);
char *ft_strcpy(char *dst, const char *src);

int main()
{
    char    *str[2];
    char    *str2[2];
    char    *ret = NULL;
    char    *ret2 = NULL;

    str[0] = strdup("test123456789101112131415161171819");
    str[1] = strdup("blabla");
    str2[0] = strdup("test123456789101112131415161171819");
    str2[1] = strdup("blabla");
    ret = ft_strcpy(str[1], str[0]);
    ret2 = strcpy(str2[1], str2[0]);

    for(int i = 0; str[1][i] != 0; i++)
        printf("%p\n", &str[1][i]);

    printf("%d\n\n", ft_strlen(str[0]));
    printf("%p = %p\n%s\n\n%p = %p\n%s\n", str[1], ret, str[1], str2[1], ret2, str2[1]);
    return 0;
}
