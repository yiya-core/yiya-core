// Copyright (c) 2014 The Bitcoin Core developers
// Copyright (c) 2019 The Yiya Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef YIYA_ZMQ_ZMQCONFIG_H
#define YIYA_ZMQ_ZMQCONFIG_H

#if defined(HAVE_CONFIG_H)
#include "config/yiya-config.h"
#endif

#include <stdarg.h>
#include <string>

#if ENABLE_ZMQ
#include <zmq.h>
#endif

#include "primitives/block.h"
#include "primitives/transaction.h"

void zmqError(const char *str);

#endif // YIYA_ZMQ_ZMQCONFIG_H
