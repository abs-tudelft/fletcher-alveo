#include <fletcher/fletcher.h>
#include <fletcher_alveo.h>
#include <gtest/gtest.h>

#include <string>
#include <vector>
#include <memory>

#include "fletcher/platform.h"
#include "fletcher/context.h"

TEST(Platform, AlveoPlatform) {
  std::shared_ptr<fletcher::Platform> platform;

  // Create
  ASSERT_TRUE(fletcher::Platform::Make("alveo", &platform, false).ok());
  ASSERT_EQ(platform->name(), "alveo");

  ASSERT_TRUE(platform->Init().ok());
}
