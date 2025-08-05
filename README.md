
# Flutter LocaQuest

Flutter 기반 위치 검색 및 리뷰 저장/조회 애플리케이션

## 📌 개요

LocaQuest는 사용자가 지역명을 검색하고, 해당 위치에 대한 리뷰를 작성하거나 다른 사용자 리뷰를 열람할 수 있는 Flutter 앱입니다.  
Firebase Firestore를 활용한 리뷰 저장, Riverpod 상태관리를 기반으로 MVVM 구조를 따릅니다.

---

## 🏗️ 기술 스택

| 기술         | 설명                                |
|--------------|-------------------------------------|
| Flutter      | UI 프레임워크                        |
| Dart         | 프로그래밍 언어                     |
| Riverpod     | 상태 관리 (AsyncNotifier 기반)       |
| Firebase     | Firestore 기반 클라우드 DB           |
| Naver API    | 지역 검색용 외부 API                 |

---

## 📁 폴더 구조


```
lib/
├── common/                # 공통 위젯, 앱바, 상수
│   ├── app_bar.dart
│   └── constants.dart
│
├── models/                # 데이터 모델 클래스
│   ├── location.dart      # 검색된 지역 정보 모델
│   └── review.dart        # 리뷰 데이터 모델
│
├── repositories/          # 데이터 저장소 (로컬/원격)
│   ├── location_repository.dart
│   └── review_repository.dart
│
├── services/              # 외부 API 호출 로직
│   └── naver_api_service.dart
│
├── viewmodels/            # Riverpod 기반 상태 관리
│   ├── location_view_model.dart
│   └── review_view_model.dart
│
├── views/                 # 주요 화면
│   ├── home_page.dart     # 지역 검색 화면
│   └── review_page.dart   # 리뷰 조회/작성 화면
│
├── widgets/               # 재사용 가능한 UI 컴포넌트
│   ├── empty_text.dart
│   └── location_tile.dart
│
├── firebase_options.dart  # flutterfire configure 생성 파일
└── main.dart              # 앱 진입점
```
---

## 🔧 기능 요약

### 1. 지역 검색

- 네이버 지역 검색 API 사용
- 검색어 입력 시 `locationViewModel`을 통해 결과 받아오기
- 결과를 리스트 형태로 보여주고, 선택 시 해당 지역의 리뷰 페이지로 이동

### 2. 리뷰 작성 및 조회

- `ReviewViewModel`에서 좌표 기반 리뷰 조회
- Firebase Firestore의 `reviews` 컬렉션에 저장
- 좌표(mapX, mapY) + 작성시간(createdAt) 기준으로 정렬 및 필터링

### 3. 상태관리

- `reviewProvider`, `locationViewModelProvider` 등 분리





## 📄 참고

* [Firebase Firestore Docs](https://firebase.google.com/docs/firestore)
* [Riverpod Docs](https://riverpod.dev/)
* [네이버 검색 API](https://developers.naver.com/docs/search/local/)



