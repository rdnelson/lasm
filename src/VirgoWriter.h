#ifndef VIRGO_WRITER_H
#define VIRGO_WRITER_H
#include "p86Assembler.h"
#include <iostream>
#include <fstream>
#include <vector>
#include "BinarySegment.hpp"
#include "IWriter.hpp"

using namespace std;


namespace VirgoWriter{

		void writeFile(vector<BinarySegment*>& segments, std::string& filename, unsigned int startingAddress);
};









#endif
