# all_prices =["$300","$1,262","$913", "$811", "$872", "$913"]
all_prices =["$1,262","$913", "$811", "$872", "$913"]



p all_prices[0][1..-1].gsub(',','').to_i
# before_sort = all_prices
# after_sort = all_prices.sort
#
# fail 'Arrays are not sorted' unless before_sort == after_sort