#include <opencv2/opencv.hpp>
#include "opencv2/xfeatures2d.hpp"

const bool DISPLAY  = 0;
const bool writeToYML = 0;
const char KEYPOINTS_DIRECTORY[50] = "keypoints";

const float WIDTH = 480.0;
const float TEST_WIDTH = 640.0;
const int MAXIMAL_KEYPOINTS = 500;
const char txtFiles[6][30] = {"ten", "twenty", "fifty", "hundred", "fivehundred", "thousand"};

cv::Ptr<cv::Feature2D> detector = cv::xfeatures2d::SiftFeatureDetector::create( MAXIMAL_KEYPOINTS );
//cv::SiftFeatureDetector detector( MAXIMAL_KEYPOINTS );
cv::Ptr<cv::Feature2D> extract = cv::xfeatures2d::SiftFeatureDetector::create();

struct invertedIndex
{
  std::vector<int> imgIndex;
  std::vector<float> weightedHistValue;
};
