#include "list.h"
#include <gillian-c/gillian-c.h>

static List *list1;
static List *list2;

void setup_tests() { list_new(&list1), list_new(&list2); }

void teardown_test() {
    list_destroy(list1);
    list_destroy(list2);
}

int main() {
    setup_tests();

    char a = (char)__builtin_annot_intval("symb_int", a);
    char str_a[] = {a, '\0'};

    char b = (char)__builtin_annot_intval("symb_int", b);
    char str_b[] = {b, '\0'};

    char c = (char)__builtin_annot_intval("symb_int", c);
    char str_c[] = {c, '\0'};

    char d = (char)__builtin_annot_intval("symb_int", d);
    char str_d[] = {d, '\0'};

    ASSERT(CC_OK == list_add(list1, str_a));
    ASSERT(CC_OK == list_add(list1, str_b));
    ASSERT(CC_OK == list_add(list1, str_c));
    ASSERT(CC_OK == list_add(list1, str_d));

    void *e;
    list_get_first(list1, &e);
    ASSERT(e != NULL);

    list_get_last(list1, &e);
    ASSERT(e != NULL);

    teardown_test();
}
