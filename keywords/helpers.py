#!/usr/bin/env python
# -*- coding: utf-8 -*-
import re

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
    Removes the Czech and Euro currencies at the end of the string.

    Returns: Price string without the currency.
    """
    pattern = r'[Kč€]'
    price_string_without_currency = re.sub(pattern, '', price_string_with_currency)
    print(price_string_without_currency)
    return price_string_without_currency

def __remove_spaces(price_string_with_spaces):
    """
    Removes the spaces from the string.

    Returns: Price without the spaces.
    """
    return price_string_with_spaces.replace(" ", "")
