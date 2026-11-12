#include "OrderModify.h"

OrderPointer OrderModify::ToOrderPointer(OrderType type) const {
    return std::make_shared<Order>(type, GetOrderId(), GetSide(), GetPrice(), GetQuantity());
}
