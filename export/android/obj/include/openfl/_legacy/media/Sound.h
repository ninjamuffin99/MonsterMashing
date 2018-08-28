// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_media_Sound
#define INCLUDED_openfl__legacy_media_Sound

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl__legacy_events_EventDispatcher
#include <openfl/_legacy/events/EventDispatcher.h>
#endif
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(openfl,_legacy,events,EventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,events,IEventDispatcher)
HX_DECLARE_CLASS3(openfl,_legacy,media,InternalAudioType)
HX_DECLARE_CLASS3(openfl,_legacy,media,Sound)
HX_DECLARE_CLASS3(openfl,_legacy,media,SoundChannel)
HX_DECLARE_CLASS3(openfl,_legacy,net,URLRequest)
HX_DECLARE_CLASS3(openfl,_legacy,utils,ByteArray)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataInput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataOutput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IMemoryRange)
HX_DECLARE_CLASS2(openfl,media,ID3Info)
HX_DECLARE_CLASS2(openfl,media,SoundLoaderContext)
HX_DECLARE_CLASS2(openfl,media,SoundTransform)

namespace openfl{
namespace _legacy{
namespace media{


class HXCPP_CLASS_ATTRIBUTES Sound_obj : public  ::openfl::_legacy::events::EventDispatcher_obj
{
	public:
		typedef  ::openfl::_legacy::events::EventDispatcher_obj super;
		typedef Sound_obj OBJ_;
		Sound_obj();

	public:
		enum { _hx_ClassId = 0x575939e3 };

		void __construct( ::openfl::_legacy::net::URLRequest stream, ::openfl::media::SoundLoaderContext context,hx::Null< bool >  __o_forcePlayAsMusic);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.media.Sound")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.media.Sound"); }
		static hx::ObjectPtr< Sound_obj > __new( ::openfl::_legacy::net::URLRequest stream, ::openfl::media::SoundLoaderContext context,hx::Null< bool >  __o_forcePlayAsMusic);
		static hx::ObjectPtr< Sound_obj > __alloc(hx::Ctx *_hx_ctx, ::openfl::_legacy::net::URLRequest stream, ::openfl::media::SoundLoaderContext context,hx::Null< bool >  __o_forcePlayAsMusic);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~Sound_obj();

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
		::String __ToString() const { return HX_HCSTRING("Sound","\xaf","\xfc","\xf9","\x13"); }

		static void __boot();
		static  ::Dynamic lime_sound_from_file;
		static Dynamic lime_sound_from_file_dyn() { return lime_sound_from_file;}
		static  ::Dynamic lime_sound_from_data;
		static Dynamic lime_sound_from_data_dyn() { return lime_sound_from_data;}
		static  ::Dynamic lime_sound_get_id3;
		static Dynamic lime_sound_get_id3_dyn() { return lime_sound_get_id3;}
		static  ::Dynamic lime_sound_get_length;
		static Dynamic lime_sound_get_length_dyn() { return lime_sound_get_length;}
		static  ::Dynamic lime_sound_close;
		static Dynamic lime_sound_close_dyn() { return lime_sound_close;}
		static  ::Dynamic lime_sound_get_status;
		static Dynamic lime_sound_get_status_dyn() { return lime_sound_get_status;}
		static  ::Dynamic lime_sound_channel_create_dynamic;
		static Dynamic lime_sound_channel_create_dynamic_dyn() { return lime_sound_channel_create_dynamic;}
		int bytesLoaded;
		int bytesTotal;
		 ::openfl::media::ID3Info id3;
		bool isBuffering;
		Float length;
		::String url;
		 ::openfl::_legacy::media::InternalAudioType _hx___audioType;
		 ::Dynamic _hx___handle;
		bool _hx___loading;
		bool _hx___dynamicSound;
		void addEventListener(::String type, ::Dynamic listener,hx::Null< bool >  useCapture,hx::Null< int >  priority,hx::Null< bool >  useWeakReference);

		void close();
		::Dynamic close_dyn();

		void load( ::openfl::_legacy::net::URLRequest stream, ::openfl::media::SoundLoaderContext context,hx::Null< bool >  forcePlayAsMusic);
		::Dynamic load_dyn();

		void loadCompressedDataFromByteArray( ::openfl::_legacy::utils::ByteArray bytes,int length,hx::Null< bool >  forcePlayAsMusic);
		::Dynamic loadCompressedDataFromByteArray_dyn();

		void loadPCMFromByteArray( ::openfl::_legacy::utils::ByteArray bytes,int samples,::String format,hx::Null< bool >  stereo,hx::Null< Float >  sampleRate);
		::Dynamic loadPCMFromByteArray_dyn();

		 ::openfl::_legacy::media::SoundChannel play(hx::Null< Float >  startTime,hx::Null< int >  loops, ::openfl::media::SoundTransform soundTransform);
		::Dynamic play_dyn();

		void _hx___checkLoading();
		::Dynamic _hx___checkLoading_dyn();

		void _hx___onError(::String msg);
		::Dynamic _hx___onError_dyn();

		 ::openfl::media::ID3Info get_id3();
		::Dynamic get_id3_dyn();

		bool get_isBuffering();
		::Dynamic get_isBuffering_dyn();

		Float get_length();
		::Dynamic get_length_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace media

#endif /* INCLUDED_openfl__legacy_media_Sound */ 
