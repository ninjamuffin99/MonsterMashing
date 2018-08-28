// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_display_OptimizedPerlin
#define INCLUDED_openfl__legacy_display_OptimizedPerlin

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,_legacy,display,BitmapData)
HX_DECLARE_CLASS3(openfl,_legacy,display,IBitmapDrawable)
HX_DECLARE_CLASS3(openfl,_legacy,display,OptimizedPerlin)

namespace openfl{
namespace _legacy{
namespace display{


class HXCPP_CLASS_ATTRIBUTES OptimizedPerlin_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef OptimizedPerlin_obj OBJ_;
		OptimizedPerlin_obj();

	public:
		enum { _hx_ClassId = 0x675b77d1 };

		void __construct(hx::Null< int >  __o_seed,hx::Null< int >  __o_numOctaves,hx::Null< Float >  __o_falloff);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.display.OptimizedPerlin")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.display.OptimizedPerlin"); }
		static hx::ObjectPtr< OptimizedPerlin_obj > __new(hx::Null< int >  __o_seed,hx::Null< int >  __o_numOctaves,hx::Null< Float >  __o_falloff);
		static hx::ObjectPtr< OptimizedPerlin_obj > __alloc(hx::Ctx *_hx_ctx,hx::Null< int >  __o_seed,hx::Null< int >  __o_numOctaves,hx::Null< Float >  __o_falloff);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~OptimizedPerlin_obj();

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
		::String __ToString() const { return HX_HCSTRING("OptimizedPerlin","\xbb","\xfa","\x7d","\x3b"); }

		static void __boot();
		static ::Array< int > P;
		int octaves;
		::Array< Float > aOctFreq;
		::Array< Float > aOctPers;
		Float fPersMax;
		Float iXoffset;
		Float iYoffset;
		Float iZoffset;
		Float baseFactor;
		void fill( ::openfl::_legacy::display::BitmapData bitmap,Float _x,Float _y,Float _z, ::Dynamic _);
		::Dynamic fill_dyn();

		void octFreqPers(Float fPersistence);
		::Dynamic octFreqPers_dyn();

		void seedOffset(int iSeed);
		::Dynamic seedOffset_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace display

#endif /* INCLUDED_openfl__legacy_display_OptimizedPerlin */ 
