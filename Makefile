CXX       := clang++
CXXFLAGS  := -std=c++20 -Wall -Wextra -O2
CPPFLAGS  := -Iinclude
TARGET    := OrderBook
SRC_DIR   := src
BUILD_DIR := build
SRCS      := $(wildcard $(SRC_DIR)/*.cpp)
OBJS      := $(SRCS:$(SRC_DIR)/%.cpp=$(BUILD_DIR)/%.o)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -MMD -MP -c $< -o $@

$(BUILD_DIR):
	mkdir -p $@

-include $(OBJS:.o=.d)

clean:
	rm -rf $(TARGET) $(BUILD_DIR)

.PHONY: clean
