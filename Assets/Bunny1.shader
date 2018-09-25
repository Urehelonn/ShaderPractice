Shader "Holistic/Bunny1"{
	Properties{
		_myColour("Example Colour", Color) = (1,1,1,1)
		_myEmission("Example Emission", Color) = (1,1,1,1)
	}

	//high level shader language
	SubShader{
		CGPROGRAM
			#pragma surface surf Lambert	//<-- complie directive, tells how dev want the code be used
			//the shader's type is surface shader, with name of surf, and will include a function with this name
			// Lambert is the light name, represent which type of light will it use to render
			struct Input {
				float2 uvMainTex;
			};	//this struct means what input data will be needed

			fixed4 _myColour;
			fixed4 _myEmission;
			//to be able to access the property of the shader;
			//refer by name and spell it precisely. fixed4 as the data type
			//fixed4, can be understand as array of 4 float values;

			//surface shader function, takes in the input structure declared eariler
			//then comes with the expected output type
			void surf(Input IN, inout SurfaceOutput o) {
				//output stucture depends on which light mode is using
				o.Emission = _myEmission.rgb;
				o.Albedo = _myColour.rgb; //albedo = diffuse colour
			}

		ENDCG
	}

	FallBack "Diffuse"
	//fall back is called whenever the code hit error,
	//and will use this defult setting instead;
}