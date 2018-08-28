// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_display_BitmapData
#define INCLUDED_openfl__legacy_display_BitmapData

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

#ifndef INCLUDED_openfl__legacy_display_IBitmapDrawable
#include <openfl/_legacy/display/IBitmapDrawable.h>
#endif
HX_DECLARE_CLASS2(haxe,io,Bytes)
HX_DECLARE_CLASS3(openfl,_legacy,display,BitmapData)
HX_DECLARE_CLASS3(openfl,_legacy,display,BlendMode)
HX_DECLARE_CLASS3(openfl,_legacy,display,IBitmapDrawable)
HX_DECLARE_CLASS3(openfl,_legacy,filters,BitmapFilter)
HX_DECLARE_CLASS3(openfl,_legacy,geom,ColorTransform)
HX_DECLARE_CLASS3(openfl,_legacy,geom,Matrix)
HX_DECLARE_CLASS3(openfl,_legacy,geom,Point)
HX_DECLARE_CLASS3(openfl,_legacy,geom,Rectangle)
HX_DECLARE_CLASS3(openfl,_legacy,utils,ByteArray)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataInput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IDataOutput)
HX_DECLARE_CLASS3(openfl,_legacy,utils,IMemoryRange)

namespace openfl{
namespace _legacy{
namespace display{


class HXCPP_CLASS_ATTRIBUTES BitmapData_obj : public hx::Object
{
	public:
		typedef hx::Object super;
		typedef BitmapData_obj OBJ_;
		BitmapData_obj();

	public:
		enum { _hx_ClassId = 0x0cd766e7 };

		void __construct(int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor, ::Dynamic gpuMode);
		inline void *operator new(size_t inSize, bool inContainer=true,const char *inName="openfl._legacy.display.BitmapData")
			{ return hx::Object::operator new(inSize,inContainer,inName); }
		inline void *operator new(size_t inSize, int extra)
			{ return hx::Object::operator new(inSize+extra,true,"openfl._legacy.display.BitmapData"); }
		static hx::ObjectPtr< BitmapData_obj > __new(int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor, ::Dynamic gpuMode);
		static hx::ObjectPtr< BitmapData_obj > __alloc(hx::Ctx *_hx_ctx,int width,int height,hx::Null< bool >  __o_transparent,hx::Null< int >  __o_fillColor, ::Dynamic gpuMode);
		static void * _hx_vtable;
		static Dynamic __CreateEmpty();
		static Dynamic __Create(hx::DynamicArray inArgs);
		//~BitmapData_obj();

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
		void *_hx_getInterface(int inHash);
		::String __ToString() const { return HX_HCSTRING("BitmapData","\xd9","\xb9","\x71","\x2a"); }

		static void __boot();
		static int CLEAR;
		static int BLACK;
		static int WHITE;
		static int RED;
		static int GREEN;
		static int BLUE;
		static ::String PNG;
		static ::String JPG;
		static int TRANSPARENT;
		static int HARDWARE;
		static int FORMAT_8888;
		static int FORMAT_4444;
		static int FORMAT_565;
		static int createColor(int rgb,hx::Null< int >  alpha);
		static ::Dynamic createColor_dyn();

		static int extractAlpha(int argb);
		static ::Dynamic extractAlpha_dyn();

		static int extractColor(int argb);
		static ::Dynamic extractColor_dyn();

		static  ::openfl::_legacy::utils::ByteArray getRGBAPixels( ::openfl::_legacy::display::BitmapData bitmapData);
		static ::Dynamic getRGBAPixels_dyn();

		static  ::openfl::_legacy::display::BitmapData load(::String filename,hx::Null< int >  format);
		static ::Dynamic load_dyn();

		static  ::openfl::_legacy::display::BitmapData loadFromBytes( ::openfl::_legacy::utils::ByteArray bytes, ::openfl::_legacy::utils::ByteArray rawAlpha);
		static ::Dynamic loadFromBytes_dyn();

		static  ::openfl::_legacy::display::BitmapData loadFromHaxeBytes( ::haxe::io::Bytes bytes, ::haxe::io::Bytes rawAlpha);
		static ::Dynamic loadFromHaxeBytes_dyn();

		static bool sameValue(int a,int b);
		static ::Dynamic sameValue_dyn();

		static int _hx___flipPixel(int pixel);
		static ::Dynamic _hx___flipPixel_dyn();

		static int _hx___ucompare(int n1,int n2);
		static ::Dynamic _hx___ucompare_dyn();

		static  ::Dynamic lime_bitmap_data_create;
		static Dynamic lime_bitmap_data_create_dyn() { return lime_bitmap_data_create;}
		static  ::Dynamic lime_bitmap_data_load;
		static Dynamic lime_bitmap_data_load_dyn() { return lime_bitmap_data_load;}
		static  ::Dynamic lime_bitmap_data_from_bytes;
		static Dynamic lime_bitmap_data_from_bytes_dyn() { return lime_bitmap_data_from_bytes;}
		static  ::Dynamic lime_bitmap_data_clear;
		static Dynamic lime_bitmap_data_clear_dyn() { return lime_bitmap_data_clear;}
		static  ::Dynamic lime_bitmap_data_clone;
		static Dynamic lime_bitmap_data_clone_dyn() { return lime_bitmap_data_clone;}
		static  ::Dynamic lime_bitmap_data_apply_filter;
		static Dynamic lime_bitmap_data_apply_filter_dyn() { return lime_bitmap_data_apply_filter;}
		static  ::Dynamic lime_bitmap_data_color_transform;
		static Dynamic lime_bitmap_data_color_transform_dyn() { return lime_bitmap_data_color_transform;}
		static  ::Dynamic lime_bitmap_data_copy;
		static Dynamic lime_bitmap_data_copy_dyn() { return lime_bitmap_data_copy;}
		static  ::Dynamic lime_bitmap_data_copy_channel;
		static Dynamic lime_bitmap_data_copy_channel_dyn() { return lime_bitmap_data_copy_channel;}
		static  ::Dynamic lime_bitmap_data_fill;
		static Dynamic lime_bitmap_data_fill_dyn() { return lime_bitmap_data_fill;}
		static  ::Dynamic lime_bitmap_data_get_pixels;
		static Dynamic lime_bitmap_data_get_pixels_dyn() { return lime_bitmap_data_get_pixels;}
		static  ::Dynamic lime_bitmap_data_get_pixel;
		static Dynamic lime_bitmap_data_get_pixel_dyn() { return lime_bitmap_data_get_pixel;}
		static  ::Dynamic lime_bitmap_data_get_pixel32;
		static Dynamic lime_bitmap_data_get_pixel32_dyn() { return lime_bitmap_data_get_pixel32;}
		static  ::Dynamic lime_bitmap_data_get_pixel_rgba;
		static  ::Dynamic lime_bitmap_data_get_array;
		static Dynamic lime_bitmap_data_get_array_dyn() { return lime_bitmap_data_get_array;}
		static  ::Dynamic lime_bitmap_data_get_color_bounds_rect;
		static Dynamic lime_bitmap_data_get_color_bounds_rect_dyn() { return lime_bitmap_data_get_color_bounds_rect;}
		static  ::Dynamic lime_bitmap_data_scroll;
		static Dynamic lime_bitmap_data_scroll_dyn() { return lime_bitmap_data_scroll;}
		static  ::Dynamic lime_bitmap_data_set_pixel;
		static Dynamic lime_bitmap_data_set_pixel_dyn() { return lime_bitmap_data_set_pixel;}
		static  ::Dynamic lime_bitmap_data_set_pixel32;
		static Dynamic lime_bitmap_data_set_pixel32_dyn() { return lime_bitmap_data_set_pixel32;}
		static  ::Dynamic lime_bitmap_data_set_pixel_rgba;
		static  ::Dynamic lime_bitmap_data_set_bytes;
		static Dynamic lime_bitmap_data_set_bytes_dyn() { return lime_bitmap_data_set_bytes;}
		static  ::Dynamic lime_bitmap_data_set_format;
		static Dynamic lime_bitmap_data_set_format_dyn() { return lime_bitmap_data_set_format;}
		static  ::Dynamic lime_bitmap_data_set_array;
		static Dynamic lime_bitmap_data_set_array_dyn() { return lime_bitmap_data_set_array;}
		static  ::Dynamic lime_bitmap_data_create_hardware_surface;
		static Dynamic lime_bitmap_data_create_hardware_surface_dyn() { return lime_bitmap_data_create_hardware_surface;}
		static  ::Dynamic lime_bitmap_data_destroy_hardware_surface;
		static Dynamic lime_bitmap_data_destroy_hardware_surface_dyn() { return lime_bitmap_data_destroy_hardware_surface;}
		static  ::Dynamic lime_bitmap_data_dispose;
		static Dynamic lime_bitmap_data_dispose_dyn() { return lime_bitmap_data_dispose;}
		static  ::Dynamic lime_bitmap_data_generate_filter_rect;
		static Dynamic lime_bitmap_data_generate_filter_rect_dyn() { return lime_bitmap_data_generate_filter_rect;}
		static  ::Dynamic lime_render_surface_to_surface;
		static Dynamic lime_render_surface_to_surface_dyn() { return lime_render_surface_to_surface;}
		static  ::Dynamic lime_bitmap_data_height;
		static Dynamic lime_bitmap_data_height_dyn() { return lime_bitmap_data_height;}
		static  ::Dynamic lime_bitmap_data_width;
		static Dynamic lime_bitmap_data_width_dyn() { return lime_bitmap_data_width;}
		static  ::Dynamic lime_bitmap_data_get_transparent;
		static  ::Dynamic lime_bitmap_data_set_flags;
		static Dynamic lime_bitmap_data_set_flags_dyn() { return lime_bitmap_data_set_flags;}
		static  ::Dynamic lime_bitmap_data_encode;
		static Dynamic lime_bitmap_data_encode_dyn() { return lime_bitmap_data_encode;}
		static  ::Dynamic lime_bitmap_data_dump_bits;
		static Dynamic lime_bitmap_data_dump_bits_dyn() { return lime_bitmap_data_dump_bits;}
		static  ::Dynamic lime_bitmap_data_flood_fill;
		static Dynamic lime_bitmap_data_flood_fill_dyn() { return lime_bitmap_data_flood_fill;}
		static  ::Dynamic lime_bitmap_data_noise;
		static Dynamic lime_bitmap_data_noise_dyn() { return lime_bitmap_data_noise;}
		static  ::Dynamic lime_bitmap_data_unmultiply_alpha;
		static Dynamic lime_bitmap_data_unmultiply_alpha_dyn() { return lime_bitmap_data_unmultiply_alpha;}
		static  ::Dynamic lime_bitmap_data_multiply_alpha;
		static Dynamic lime_bitmap_data_multiply_alpha_dyn() { return lime_bitmap_data_multiply_alpha;}
		static  ::Dynamic lime_bitmap_data_get_prem_alpha;
		static Dynamic lime_bitmap_data_get_prem_alpha_dyn() { return lime_bitmap_data_get_prem_alpha;}
		static  ::Dynamic lime_bitmap_data_set_prem_alpha;
		static Dynamic lime_bitmap_data_set_prem_alpha_dyn() { return lime_bitmap_data_set_prem_alpha;}
		int height;
		 ::openfl::_legacy::geom::Rectangle rect;
		bool transparent;
		int width;
		 ::Dynamic _hx___handle;
		bool _hx___transparent;
		void applyFilter( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint, ::openfl::_legacy::filters::BitmapFilter filter);
		::Dynamic applyFilter_dyn();

		void clear(int color);
		::Dynamic clear_dyn();

		 ::openfl::_legacy::display::BitmapData clone();
		::Dynamic clone_dyn();

		void colorTransform( ::openfl::_legacy::geom::Rectangle rect, ::openfl::_legacy::geom::ColorTransform colorTransform);
		::Dynamic colorTransform_dyn();

		void copyChannel( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint,int sourceChannel,int destChannel);
		::Dynamic copyChannel_dyn();

		void copyPixels( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint, ::openfl::_legacy::display::BitmapData alphaBitmapData, ::openfl::_legacy::geom::Point alphaPoint,hx::Null< bool >  mergeAlpha);
		::Dynamic copyPixels_dyn();

		void createHardwareSurface();
		::Dynamic createHardwareSurface_dyn();

		void destroyHardwareSurface();
		::Dynamic destroyHardwareSurface_dyn();

		void dispose();
		::Dynamic dispose_dyn();

		void draw(::Dynamic source, ::openfl::_legacy::geom::Matrix matrix, ::openfl::_legacy::geom::ColorTransform colorTransform, ::openfl::_legacy::display::BlendMode blendMode, ::openfl::_legacy::geom::Rectangle clipRect,hx::Null< bool >  smoothing);
		::Dynamic draw_dyn();

		void dumpBits();
		::Dynamic dumpBits_dyn();

		 ::openfl::_legacy::utils::ByteArray encode( ::Dynamic rectOrFormat, ::Dynamic compressorOrQuality, ::openfl::_legacy::utils::ByteArray byteArray);
		::Dynamic encode_dyn();

		void fillRect( ::openfl::_legacy::geom::Rectangle rect,int color);
		::Dynamic fillRect_dyn();

		void fillRectEx( ::openfl::_legacy::geom::Rectangle rect,int color,hx::Null< int >  alpha);
		::Dynamic fillRectEx_dyn();

		void floodFill(int x,int y,int color);
		::Dynamic floodFill_dyn();

		 ::openfl::_legacy::geom::Rectangle generateFilterRect( ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::filters::BitmapFilter filter);
		::Dynamic generateFilterRect_dyn();

		 ::openfl::_legacy::geom::Rectangle getColorBoundsRect(int mask,int color,hx::Null< bool >  findColor);
		::Dynamic getColorBoundsRect_dyn();

		int getPixel(int x,int y);
		::Dynamic getPixel_dyn();

		int getPixel32(int x,int y);
		::Dynamic getPixel32_dyn();

		 ::openfl::_legacy::utils::ByteArray getPixels( ::openfl::_legacy::geom::Rectangle rect);
		::Dynamic getPixels_dyn();

		::Array< int > getVector( ::openfl::_legacy::geom::Rectangle rect);
		::Dynamic getVector_dyn();

		void lock();
		::Dynamic lock_dyn();

		void merge( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint,int redMultiplier,int greenMultiplier,int blueMultiplier,int alphaMultiplier);
		::Dynamic merge_dyn();

		void multiplyAlpha();
		::Dynamic multiplyAlpha_dyn();

		void noise(int randomSeed,hx::Null< int >  low,hx::Null< int >  high,hx::Null< int >  channelOptions,hx::Null< bool >  grayScale);
		::Dynamic noise_dyn();

		void paletteMap( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint,::Array< int > redArray,::Array< int > greenArray,::Array< int > blueArray,::Array< int > alphaArray);
		::Dynamic paletteMap_dyn();

		void perlinNoise(Float baseX,Float baseY,int numOctaves,int randomSeed,bool stitch,bool fractalNoise,hx::Null< int >  channelOptions,hx::Null< bool >  grayScale,::Array< ::Dynamic> offsets);
		::Dynamic perlinNoise_dyn();

		void scroll(int x,int y);
		::Dynamic scroll_dyn();

		void setFlags(int flags);
		::Dynamic setFlags_dyn();

		void setFormat(int format);
		::Dynamic setFormat_dyn();

		void setPixel(int x,int y,int color);
		::Dynamic setPixel_dyn();

		void setPixel32(int x,int y,int color);
		::Dynamic setPixel32_dyn();

		void setPixels( ::openfl::_legacy::geom::Rectangle rect, ::openfl::_legacy::utils::ByteArray pixels);
		::Dynamic setPixels_dyn();

		void setVector( ::openfl::_legacy::geom::Rectangle rect,::Array< int > pixels);
		::Dynamic setVector_dyn();

		int threshold( ::openfl::_legacy::display::BitmapData sourceBitmapData, ::openfl::_legacy::geom::Rectangle sourceRect, ::openfl::_legacy::geom::Point destPoint,::String operation,int threshold,hx::Null< int >  color,hx::Null< int >  mask,hx::Null< bool >  copySource);
		::Dynamic threshold_dyn();

		void unlock( ::openfl::_legacy::geom::Rectangle changeRect);
		::Dynamic unlock_dyn();

		void unmultiplyAlpha();
		::Dynamic unmultiplyAlpha_dyn();

		void _hx___drawToSurface( ::Dynamic surface, ::openfl::_legacy::geom::Matrix matrix, ::openfl::_legacy::geom::ColorTransform colorTransform,::String blendMode, ::openfl::_legacy::geom::Rectangle clipRect,bool smoothing);
		::Dynamic _hx___drawToSurface_dyn();

		void _hx___loadFromBytes( ::openfl::_legacy::utils::ByteArray bytes, ::openfl::_legacy::utils::ByteArray rawAlpha);
		::Dynamic _hx___loadFromBytes_dyn();

		bool get_premultipliedAlpha();
		::Dynamic get_premultipliedAlpha_dyn();

		bool set_premultipliedAlpha(bool value);
		::Dynamic set_premultipliedAlpha_dyn();

		 ::openfl::_legacy::geom::Rectangle get_rect();
		::Dynamic get_rect_dyn();

		int get_width();
		::Dynamic get_width_dyn();

		int get_height();
		::Dynamic get_height_dyn();

		bool get_transparent();
		::Dynamic get_transparent_dyn();

};

} // end namespace openfl
} // end namespace _legacy
} // end namespace display

#endif /* INCLUDED_openfl__legacy_display_BitmapData */ 
