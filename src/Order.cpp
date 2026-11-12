#include "Order.h"

#include <format>
#include <stdexcept>

void Order::Fill(Quantity quantity) {
    if (quantity > GetRemainingQuantity())
        throw std::logic_error(std::format("Order ({} cannot be filled for more than its remaining quantity).", GetOrderId()));
    remainingQuantity_ -= quantity;
}
