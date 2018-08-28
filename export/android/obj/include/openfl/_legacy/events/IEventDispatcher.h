// Generated by Haxe 3.4.7
#ifndef INCLUDED_openfl__legacy_events_IEventDispatcher
#define INCLUDED_openfl__legacy_events_IEventDispatcher

#ifndef HXCPP_H
#include <hxcpp.h>
#endif

HX_DECLARE_CLASS3(openfl,_legacy,events,Event)
HX_DECLARE_CLASS3(openfl,_legacy,events,IEventDispatcher)

namespace openfl{
namespace _legacy{
namespace events{


class HXCPP_CLASS_ATTRIBUTES IEventDispatcher_obj {
	public:
		typedef hx::Object super;
		HX_DO_INTERFACE_RTTI;

		void (hx::Object :: *_hx_addEventListener)(::String type, ::Dynamic listener,hx::Null< bool >  useCapture,hx::Null< int >  priority,hx::Null< bool >  useWeakReference); 
		static inline void addEventListener( ::Dynamic _hx_,::String type, ::Dynamic listener,hx::Null< bool >  useCapture,hx::Null< int >  priority,hx::Null< bool >  useWeakReference) {
			(_hx_.mPtr->*( static_cast< ::openfl::_legacy::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0x4cbe6489)))->_hx_addEventListener)(type,listener,useCapture,priority,useWeakReference);
		}
		bool (hx::Object :: *_hx_dispatchEvent)( ::openfl::_legacy::events::Event event); 
		static inline bool dispatchEvent( ::Dynamic _hx_, ::openfl::_legacy::events::Event event) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0x4cbe6489)))->_hx_dispatchEvent)(event);
		}
		bool (hx::Object :: *_hx_hasEventListener)(::String type); 
		static inline bool hasEventListener( ::Dynamic _hx_,::String type) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0x4cbe6489)))->_hx_hasEventListener)(type);
		}
		void (hx::Object :: *_hx_removeEventListener)(::String type, ::Dynamic listener,hx::Null< bool >  useCapture); 
		static inline void removeEventListener( ::Dynamic _hx_,::String type, ::Dynamic listener,hx::Null< bool >  useCapture) {
			(_hx_.mPtr->*( static_cast< ::openfl::_legacy::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0x4cbe6489)))->_hx_removeEventListener)(type,listener,useCapture);
		}
		bool (hx::Object :: *_hx_willTrigger)(::String type); 
		static inline bool willTrigger( ::Dynamic _hx_,::String type) {
			return (_hx_.mPtr->*( static_cast< ::openfl::_legacy::events::IEventDispatcher_obj *>(_hx_.mPtr->_hx_getInterface(0x4cbe6489)))->_hx_willTrigger)(type);
		}
};

} // end namespace openfl
} // end namespace _legacy
} // end namespace events

#endif /* INCLUDED_openfl__legacy_events_IEventDispatcher */ 
