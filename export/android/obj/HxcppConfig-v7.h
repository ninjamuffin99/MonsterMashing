#ifndef HXCPP_CONFIG_INCLUDED
#define HXCPP_CONFIG_INCLUDED

#if !defined(HXCPP_VISIT_ALLOCS) && !defined(NO_HXCPP_VISIT_ALLOCS)
#define HXCPP_VISIT_ALLOCS 
#endif

#if !defined(HXCPP_API_LEVEL) && !defined(NO_HXCPP_API_LEVEL)
#define HXCPP_API_LEVEL 331
#endif

#if !defined(_LINUX_STDDEF_H ) && !defined(NO__LINUX_STDDEF_H )
#define _LINUX_STDDEF_H  
#endif

#if !defined(HXCPP_CPP11) && !defined(NO_HXCPP_CPP11)
#define HXCPP_CPP11 
#endif

#if !defined(ANDROID) && !defined(NO_ANDROID)
#define ANDROID ANDROID
#endif

#if !defined(HX_ANDROID) && !defined(NO_HX_ANDROID)
#define HX_ANDROID 
#endif

#if !defined(HXCPP_ANDROID_PLATFORM) && !defined(NO_HXCPP_ANDROID_PLATFORM)
#define HXCPP_ANDROID_PLATFORM 9
#endif

#if !defined(NDEBUG) && !defined(NO_NDEBUG)
#define NDEBUG 
#endif

#include <hxcpp.h>

#endif
