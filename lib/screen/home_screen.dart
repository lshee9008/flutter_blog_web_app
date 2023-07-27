// 필요한 라이브러리를 임포트합니다.
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// 웹뷰 컨트롤러를 선언하고 초기 설정을 수행합니다.
WebViewController? controller = WebViewController()
  ..setJavaScriptMode(
      JavaScriptMode.unrestricted) // JavaScript 모드를 제한 없음으로 설정합니다.
  ..setBackgroundColor(
      const Color.fromARGB(0, 34, 20, 20)) // 배경 색상을 투명으로 설정합니다.
  ..setNavigationDelegate(
    NavigationDelegate(
      onProgress: (int progress) {
        // 웹페이지 로딩 진행 상태에 대한 콜백입니다. 로딩 바를 업데이트할 수 있습니다.
      },
      onPageStarted: (String url) {
        // 웹페이지 로딩이 시작되었을 때 호출되는 콜백입니다.
      },
      onPageFinished: (String url) {
        // 웹페이지 로딩이 완료되었을 때 호출되는 콜백입니다.
      },
      onWebResourceError: (WebResourceError error) {
        // 웹 자원 로딩 중 오류가 발생했을 때 호출되는 콜백입니다.
      },
      onNavigationRequest: (NavigationRequest request) {
        // 페이지 이동 요청에 대한 콜백입니다.
        // 만약 요청한 URL이 'url'로 시작한다면 페이지 이동을 방지합니다.
        if (request.url.startsWith('url')) {
          return NavigationDecision.prevent; // 페이지 이동을 막습니다.
        }
        return NavigationDecision.navigate; // 페이지 이동을 허용합니다.
      },
    ),
  )
  ..loadRequest(
      Uri.parse('https://github.com/lshee9008')); // 초기 로드할 URL을 설정합니다.

// 앱의 홈 화면을 정의하는 StatelessWidget입니다.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: const Text(
          'lshee9008 GitHub', // 앱 바 제목을 'Leesh'로 설정합니다.
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 255, 132, 17),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // 홈 아이콘을 누르면, 컨트롤러를 사용하여 웹뷰를 'https://www.youtube.com'으로 이동합니다.
              if (controller != null) {
                controller!
                    .loadRequest(Uri.parse('https://github.com/lshee9008'));
              }
            },
            icon: const Icon(
              Icons.home, // 홈 아이콘을 설정합니다.
              size: 30,
              color: Color.fromARGB(255, 255, 132, 17),
            ),
          ),
        ],
      ),
      body: WebViewWidget(controller: controller!), // 컨트롤러를 이용하여 웹뷰 위젯을 생성합니다.
    );
  }
}
