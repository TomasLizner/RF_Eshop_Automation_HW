#!/usr/bin/env python
# -*- coding: utf-8 -*-

def parse_clean_price(price_string_original):
    """
    Takes the whole price string with spaces and currency and returns just the clean price.

    Returns: Clean price as number.
    """

    price_string_without_currency = __remove_currency(price_string_original)
    clean_price = __remove_spaces(price_string_without_currency)
    print(clean_price)
    return clean_price

def __remove_currency(price_string_with_currency):
    """
    Removes the Czech currency at the end of the string.

    Returns: Price string without the currency.
    """

    string_size = len(price_string_with_currency)
    price_string_without_currency = price_string_with_currency[:string_size - 2]
    print(price_string_without_currency)
    return price_string_without_currency

def __remove_spaces(price_string_with_spaces):
    """
    Removes the spaces from the string.

    Returns: Price without the spaces.
    """
    return price_string_with_spaces.replace(" ", "")
