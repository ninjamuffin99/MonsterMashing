// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_media_SoundChannel
#define INCLUDED_openfl__legacy_media_SoundChannel

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(openfl,_legacy,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,events,IEventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,media,AudioThreadState)
HX_DECLARE_CLASS3(openfl,_legacy,media,Sound)
HX_DECLARE_CLASS3(openfl,_legacy,media,SoundChannel)
HX_DECLARE_CLASS3(openfl,_legacy,utils,ByteArray)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataInput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataOutput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IMemoryRange)
HX_DECLARE_CLASS2(openfl,media,SoundTransform)

namespace openfl{
namespace _legacy{
namespace media{


class HXCPP_CLASS_ATTRIBUTES SoundChannel_obj : public  ::openfl::_legacy::events::EventDispatcher_obj
{
	public:
		typedef  ::openfl::_legacy::events::EventDispatcher_obj super;
		typedef SoundChannel_obj OBJ_;
		SoundChannel_obj();

	public:
		enum { _hx_ClassId = 0x3bda65e8 };

		void __construct( ::Dynamic handle,hx::Null< Float >  __o_startTime,hx::Null< int >  __o_loops, ::openfl::media::SoundTransform soundTransform);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.media.SoundChannel")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.media.SoundChannel"); }
		static hx::ObjectPtr< SoundChannel_obj > __new( ::Dynamic handle,hx::Null< Float >  __o_startTime,hx::Null< int >  __o_loops, ::openfl::media::SoundTransform soundTransform);
		static hx::ObjectPtr< SoundChannel_obj > __alloc(hx::Ctx *_hx_ctx, ::Dynamic handle,hx::Null< Float >  __o_startTime,hx::Null< int >  __o_loops, ::openfl::media::SoundTransform soundTransform);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~SoundChannel_obj();

		HX_DO_RTTI_ALL;
		hx::Val __Field(const ::String &inString, hx::PropertyAccess inCallProp);
		static bool __GetStatic(const ::String &inString, Dynamic &outValue, hx::PropertyAccess inCallProp);
		hx::Val __SetField(const ::String &inString,const hx::Val &inValue, hx::PropertyAccess inCallProp);
		static bool __SetStatic(const ::String &inString, Dynamic &ioValue, hx::PropertyAccess inCallProp);
		void __GetFields(Array< ::String> &outFields);
		static void __register();
		void __Mark(HX_MARK_PARAMS);
		void __Visit(HX_VISIT_PARAMS);
		bool _hx_isInstanceOf(int inClassId);
		::String __ToString() const { return HX_HCSTRING("SoundChannel","\xd4","\xaf","\x1c","\xa9"); }

		static void __boot();
		static int _hx___dynamicSoundCount;
		static ::Array< ::Dynamic> _hx___incompleteList;
		static  ::openfl::_legacy::media::AudioThreadState _hx___audioState;
		static bool _hx___audioThreadIsIdle;
		static bool _hx___audioThreadRunning;
		static  ::openfl::_legacy::media::SoundChannel createDynamic( ::Dynamic handle, ::openfl::media::SoundTransform soundTransform, ::openfl::_legacy::events::EventDispatcher dataProvider);
		static ::Dynamic createDynamic_dyn();

		static void _hx___checkCompleteBackgroundThread();
		static ::Dynamic _hx___checkCompleteBackgroundThread_dyn();

		static bool _hx___completePending();
		static ::Dynamic _hx___completePending_dyn();

		static void _hx___pollComplete();
		static ::Dynamic _hx___pollComplete_dyn();

		static  ::Dynamic lime_sound_channel_is_complete;
		static Dynamic lime_sound_channel_is_complete_dyn() { return lime_sound_channel_is_complete;}
		static  ::Dynamic lime_sound_channel_get_left;
		static Dynamic lime_sound_channel_get_left_dyn() { return lime_sound_channel_get_left;}
		static  ::Dynamic lime_sound_channel_get_right;
		static Dynamic lime_sound_channel_get_right_dyn() { return lime_sound_channel_get_right;}
		static  ::Dynamic lime_sound_channel_get_position;
		static Dynamic lime_sound_channel_get_position_dyn() { return lime_sound_channel_get_position;}
		static  ::Dynamic lime_sound_channel_set_position;
		static Dynamic lime_sound_channel_set_position_dyn() { return lime_sound_channel_set_position;}
		static  ::Dynamic lime_sound_channel_get_data_position;
		static Dynamic lime_sound_channel_get_data_position_dyn() { return lime_sound_channel_get_data_position;}
		static  ::Dynamic lime_sound_channel_stop;
		static Dynamic lime_sound_channel_stop_dyn() { return lime_sound_channel_stop;}
		static  ::Dynamic lime_sound_channel_create;
		static Dynamic lime_sound_channel_create_dyn() { return lime_sound_channel_create;}
		static  ::Dynamic lime_sound_channel_set_transform;
		static Dynamic lime_sound_channel_set_transform_dyn() { return lime_sound_channel_set_transform;}
		static  ::Dynamic lime_sound_channel_set_pitch;
		static Dynamic lime_sound_channel_set_pitch_dyn() { return lime_sound_channel_set_pitch;}
		static  ::Dynamic lime_sound_channel_needs_data;
		static Dynamic lime_sound_channel_needs_data_dyn() { return lime_sound_channel_needs_data;}
		static  ::Dynamic lime_sound_channel_add_data;
		static Dynamic lime_sound_channel_add_data_dyn() { return lime_sound_channel_add_data;}
		Float leftPeak;
		Float rightPeak;
		 ::openfl::_legacy::events::EventDispatcher _hx___dataProvider;
		 ::Dynamic _hx___handle;
		Float _hx___pitch;
		 ::openfl::_legacy::media::Sound _hx___soundInstance;
		 ::openfl::media::SoundTransform _hx___transform;
		 ::openfl::_legacy::utils::ByteArray _hx___dynamicBytes;
		bool _hx___thread_completed;
		bool _hx___addedToThread;
		void stop();
		::Dynamic stop_dyn();

		bool _hx___checkComplete();
		::Dynamic _hx___checkComplete_dyn();

		bool _hx___runCheckComplete();
		::Dynamic _hx___runCheckComplete_dyn();

		Float get_leftPeak();
		::Dynamic get_leftPeak_dyn();

		Float get_rightPeak();
		::Dynamic get_rightPeak_dyn();

		Float get_pitch();
		::Dynamic get_pitch_dyn();

		Float set_pitch(Float value);
		::Dynamic set_pitch_dyn();

		Float get_position();
		::Dynamic get_position_dyn();

		Float set_position(Float value);
		::Dynamic set_position_dyn();

		 ::openfl::media::SoundTransform get_soundTransform();
		::Dynamic get_soundTransform_dyn();

		 ::openfl::media::SoundTransform set_soundTransform( ::openfl::media::SoundTransform value);
		::Dynamic set_soundTransform_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace media

#endif /* INCLUDED_openfl__legacy_media_SoundChannel */ 
