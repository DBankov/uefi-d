/**
	Based on Protocol/SimplePointer.h, original notice:

	Simple Pointer protocol from the UEFI 2.0 specification.
	
	Abstraction of a very simple pointer device like a mouse or trackball.
	
	Copyright (c) 2006 - 2008, Intel Corporation. All rights reserved.
	This program and the accompanying materials
	are licensed and made available under the terms and conditions of the BSD License
	which accompanies this distribution.  The full text of the license may be found at
	http://opensource.org/licenses/bsd-license.php
	
	THE PROGRAM IS DISTRIBUTED UNDER THE BSD LICENSE ON AN "AS IS" BASIS,
	WITHOUT WARRANTIES OR REPRESENTATIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED.
	
**/
module uefi.protocols.simplepointer;
import uefi.base;
import uefi.base_type;

public:
extern (C):
enum EFI_GUID EFI_SIMPLE_POINTER_PROTOCOL_GUID = EFI_GUID(0x31878c87, 0xb75,
        0x11d5, [0x9a, 0x4f, 0x0, 0x90, 0x27, 0x3f, 0xc1, 0x4d]);
alias EFI_SIMPLE_POINTER_PROTOCOL = _EFI_SIMPLE_POINTER_PROTOCOL;
struct EFI_SIMPLE_POINTER_STATE
{
    ///
    /// The signed distance in counts that the pointer device has been moved along the x-axis.
    ///
    INT32 RelativeMovementX;
    ///
    /// The signed distance in counts that the pointer device has been moved along the y-axis.
    ///
    INT32 RelativeMovementY;
    ///
    /// The signed distance in counts that the pointer device has been moved along the z-axis.
    ///
    INT32 RelativeMovementZ;
    ///
    /// If TRUE, then the left button of the pointer device is being
    /// pressed. If FALSE, then the left button of the pointer device is not being pressed.
    ///
    BOOLEAN LeftButton;
    ///
    /// If TRUE, then the right button of the pointer device is being
    /// pressed. If FALSE, then the right button of the pointer device is not being pressed.
    ///
    BOOLEAN RightButton;
}

struct EFI_SIMPLE_POINTER_MODE
{
    ///
    /// The resolution of the pointer device on the x-axis in counts/mm.
    /// If 0, then the pointer device does not support an x-axis.
    ///
    UINT64 ResolutionX;
    ///
    /// The resolution of the pointer device on the y-axis in counts/mm.
    /// If 0, then the pointer device does not support an x-axis.
    ///
    UINT64 ResolutionY;
    ///
    /// The resolution of the pointer device on the z-axis in counts/mm.
    /// If 0, then the pointer device does not support an x-axis.
    ///
    UINT64 ResolutionZ;
    ///
    /// TRUE if a left button is present on the pointer device. Otherwise FALSE.
    ///
    BOOLEAN LeftButton;
    ///
    /// TRUE if a right button is present on the pointer device. Otherwise FALSE.
    ///
    BOOLEAN RightButton;
}
/**
	Resets the pointer device hardware.
	
	@param  This                  A pointer to the EFI_SIMPLE_POINTER_PROTOCOL
	instance.
	@param  ExtendedVerification  Indicates that the driver may perform a more exhaustive
	verification operation of the device during reset.
	
	@retval EFI_SUCCESS           The device was reset.
	@retval EFI_DEVICE_ERROR      The device is not functioning correctly and could not be reset.
	
**/
alias EFI_SIMPLE_POINTER_RESET = EFI_STATUS function(
    EFI_SIMPLE_POINTER_PROTOCOL* This, BOOLEAN ExtendedVerification) @nogc nothrow;
/**
	Retrieves the current state of a pointer device.
	
	@param  This                  A pointer to the EFI_SIMPLE_POINTER_PROTOCOL
	instance.
	@param  State                 A pointer to the state information on the pointer device.
	
	@retval EFI_SUCCESS           The state of the pointer device was returned in State.
	@retval EFI_NOT_READY         The state of the pointer device has not changed since the last call to
	GetState().
	@retval EFI_DEVICE_ERROR      A device error occurred while attempting to retrieve the pointer device's
	current state.
	
**/
alias EFI_SIMPLE_POINTER_GET_STATE = EFI_STATUS function(
    EFI_SIMPLE_POINTER_PROTOCOL* This, EFI_SIMPLE_POINTER_STATE* State) @nogc nothrow;
/// The EFI_SIMPLE_POINTER_PROTOCOL provides a set of services for a pointer
/// device that can use used as an input device from an application written
/// to this specification. The services include the ability to reset the
/// pointer device, retrieve get the state of the pointer device, and
/// retrieve the capabilities of the pointer device.
struct _EFI_SIMPLE_POINTER_PROTOCOL
{
    EFI_SIMPLE_POINTER_RESET Reset;
    EFI_SIMPLE_POINTER_GET_STATE GetState;
    ///
    /// Event to use with WaitForEvent() to wait for input from the pointer device.
    ///
    EFI_EVENT WaitForInput;
    ///
    /// Pointer to EFI_SIMPLE_POINTER_MODE data.
    ///
    EFI_SIMPLE_POINTER_MODE* Mode;

}
