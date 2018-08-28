// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_utils_Timer
#define INCLUDED_openfl__legacy_utils_Timer

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
HX_DECLARE_CLASS1(haxe,Timer)
HX_DECLARE_CLASS3(openfl,_legacy,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,events,IEventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,utils,Timer)

namespace openfl{
namespace _legacy{
namespace utils{


class HXCPP_CLASS_ATTRIBUTES Timer_obj : public  ::openfl::_legacy::events::EventDispatcher_obj
{
	public:
		typedef  ::openfl::_legacy::events::EventDispatcher_obj super;
		typedef Timer_obj OBJ_;
		Timer_obj();

	public:
		enum { _hx_ClassId = 0x023dcd64 };

		void __construct(Float delay,hx::Null< int >  __o_repeatCount);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.utils.Timer")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.utils.Timer"); }
		static hx::ObjectPtr< Timer_obj > __new(Float delay,hx::Null< int >  __o_repeatCount);
		static hx::ObjectPtr< Timer_obj > __alloc(hx::Ctx *_hx_ctx,Float delay,hx::Null< int >  __o_repeatCount);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Timer_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("Timer","\xa5","\x2f","\x63","\xa3"); }

		int currentCount;
		int repeatCount;
		bool running;
		Float _hx___delay;
		 ::haxe::Timer _hx___timer;
		void reset();
		::Dynamic reset_dyn();

		void start();
		::Dynamic start_dyn();

		void stop();
		::Dynamic stop_dyn();

		Float get_delay();
		::Dynamic get_delay_dyn();

		Float set_delay(Float value);
		::Dynamic set_delay_dyn();

		void timer_onTimer();
		::Dynamic timer_onTimer_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace utils

#endif /* INCLUDED_openfl__legacy_utils_Timer */ 
