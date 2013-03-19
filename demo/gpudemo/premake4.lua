function createProject(vendor)
	
	hasCL = findOpenCL(vendor)
	
	if (hasCL) then

		project ("Bullet3_OpenCL_gpu_demo_" .. vendor)

		initOpenCL(vendor)
		
		language "C++"
				
		kind "ConsoleApp"
		targetdir "../../bin"


		initOpenGL()
		initGlew()

		includedirs {
		 	"..",
		 	"../../src",
		 	"../../btgui",
		 	"../../opencl"
		}
		
		links {
			"gwen"
		}
		
		files {
			"**.cpp",
			"**.h",
			
			"../ObjLoader/string_extra.cpp",
			"../ObjLoader/string_extra.h",
			"../ObjLoader/objLoader.cpp",
			"../ObjLoader/objLoader.h",
			"../ObjLoader/obj_parser.cpp",
			"../ObjLoader/obj_parser.h",
			"../ObjLoader/list.cpp",
			"../ObjLoader/list.h",
			
			"../../src/BulletCommon/btAlignedAllocator.cpp",
			"../../src/BulletCommon/btAlignedAllocator.h",
			"../../src/BulletCommon/btQuickprof.cpp",
			"../../src/BulletCommon/btQuickprof.h",
			"../../src/BulletGeometry/btConvexHullComputer.cpp",
			"../../src/BulletGeometry/btConvexHullComputer.h",
			
			"../../btgui/OpenGLWindow/GLInstancingRenderer.cpp",
			"../../btgui/OpenGLWindow/GLInstancingRenderer.h",
			"../../btgui/OpenGLWindow/GLPrimitiveRenderer.cpp",
			"../../btgui/OpenGLWindow/GLPrimitiveRenderer.h",
			"../../btgui/OpenGLWindow/LoadShader.cpp",
			"../../btgui/OpenGLWindow/LoadShader.h",
			"../../btgui/OpenGLWindow/TwFonts.cpp",
			"../../btgui/OpenGLWindow/TwFonts.h",
			"../../btgui/OpenGLTrueTypeFont/fontstash.cpp",
			"../../btgui/OpenGLTrueTypeFont/fontstash.h",
			"../../btgui/OpenGLTrueTypeFont/opengl_fontstashcallbacks.cpp",
			"../../btgui/OpenGLTrueTypeFont/opengl_fontstashcallbacks.h",
			"../../btgui/FontFiles/OpenSans.cpp",
			"../../opencl/basic_initialize/btOpenCLUtils.cpp",
			"../../opencl/basic_initialize/btOpenCLUtils.h",
			"../../opencl/gpu_broadphase/host/btGpuSapBroadphase.cpp",
			"../../opencl/gpu_sat/host/btConvexUtility.cpp",
			"../../opencl/gpu_sat/host/ConvexHullContact.cpp",
			"../../opencl/gpu_sat/host/ConvexHullContact.h",
			"../../opencl/parallel_primitives/host/btBoundSearchCL.cpp",
			"../../opencl/parallel_primitives/host/btBoundSearchCL.h",
			"../../opencl/parallel_primitives/host/btFillCL.cpp",
			"../../opencl/parallel_primitives/host/btFillCL.h",
			"../../opencl/parallel_primitives/host/btPrefixScanCL.cpp",
			"../../opencl/parallel_primitives/host/btPrefixScanCL.h",
			"../../opencl/parallel_primitives/host/btRadixSort32CL.cpp",
			"../../opencl/parallel_primitives/host/btRadixSort32CL.h",
			"../../opencl/gpu_rigidbody/host/**.cpp",
			"../../opencl/gpu_rigidbody/host/**.h",

		}

		if os.is("Windows") then 
			files{  
				"../../btgui/OpenGLWindow/Win32OpenGLWindow.cpp",
      	"../../btgui/OpenGLWindow/Win32OpenGLWindow.h",
      	"../../btgui/OpenGLWindow/Win32Window.cpp",
      	"../../btgui/OpenGLWindow/Win32Window.h",
			}
		end
		if os.is("Linux") then
			files {
				"../../btgui/OpenGLWindow/X11OpenGLWindow.cpp",
				"../../btgui/OpenGLWindow/X11OpenGLWindows.h"
			}
		end
		if os.is("MacOSX") then
			links {"Cocoa.framework"}
			files {
				"../../btgui/OpenGLWindow/MacOpenGLWindow.h",
                        	"../../btgui/OpenGLWindow/MacOpenGLWindow.mm",	
			}
		end
	end
end

createProject("Apple")
createProject("AMD")
createProject("Intel")
createProject("NVIDIA")
