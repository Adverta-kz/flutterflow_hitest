// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:requests/requests.dart';

Future<String> payments() async {
  var jsonData = {
    "order_id": "my-order",
    "auto_clearing": 1,
    "amount": 20,
    "currency": "KZT",
    "description": "Описание заказа",
    "test": 0,
    "options": {
      "custom_params": {},
      "user": {"email": "string", "phone": "string"}
    },
    "transaction": {
      "type": "tokenized_card",
      "options": {
        "token":
            "eyJhbGciOiJSU0ExXzUiLCJlbmMiOiJBMTI4Q0JDLUhTMjU2In0.eTYB5I4ttwS6CM1oawgYRf9aLfTFzcEK3mKjJ5AMNCM69SdWysQdjrWVTh3Mh7BQtJYypmnbYNZb5SdSkvMawqnnEaEjS4UFFLM_bXYa8Eut3ZX4tXL-rZfouzUdpjatXsMvcxOixGiQm2UP6pEo7tAOx_t5h2_y8vk9so8garyTBbOQqF3MKDGShRLQUyNqcYzg1qezE_OZiFnpS1uU_x6La2XqqgkejIfiS2f3lc4DkD5aygM_yGwDcQMeGRdgBI_rg23q71zbOxuFOXoXVRdIdx2Y_V_tZ3JnXX1KkZSqdUNL2-XMGCC4Nnk2A3W1YQ_Ld0gN02b4Om43Nmpr9Q.xcXMT0eeva-2UnX3zNK1KQ._thk7WP3-pcIh_XuS_tnUkCYcNsnw0-yUbzx1rsq182jy1SH0PDaM_54KYfsqzgsemplO5U2tzPivx_k9VzoLwFFxjHfIMmVc3SFleyVIIKO0xY0KsU7fzNf4_BKwvXR6Ur4Q3E1g8NE4sWQJpy6tQ.vKqh65_qZS9-G2JmxYLErQ",
        "card_cvv": 223
      }
    }
  };

  // Send the JSON data to the website using POST method
  var response = await Requests.post('https://google.com', body: jsonData);

  // Check if the response was successful
  if (response.success) {
    // Return the response body as a string
    return response.content();
  } else {
    // Return an error message
    return 'Error: ${response.statusCode}';
  }
}
