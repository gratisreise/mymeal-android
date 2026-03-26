# 🍽️ MyMeal Android

> AI 기반 식단 관리 모바일 앱 — Flutter 클라이언트

MyMeal은 사용자가 식사를 사진으로 기록하면 AI가 음식을 분석하고, 식후 반응을 추적하여 더 나은 식습관을 만들 수 있도록 도와주는 앱입니다.

---

## 📱 주요 기능

| 기능 | 설명 |
|---|---|
| 🔐 **인증** | 이메일 로그인, 회원가입, Google / Naver / Kakao 소셜 로그인 |
| 📷 **식사 기록** | 사진 촬영으로 간단하게 식사 등록 및 AI 음식 자동 분석 |
| 📓 **식사 일지** | 날짜별 식사 기록 캘린더 및 상세 조회 |
| 😊 **식후 반응** | 소화·포만감·에너지 등 식후 컨디션 기록 |
| 💡 **인사이트** | 식습관 패턴 분석 및 건강 리포트 |
| 🏆 **랭킹** | 식사 점수 기반 커뮤니티 랭킹 |
| 👤 **프로필** | 회원 정보 관리 및 앱 설정 |

---

## 🛠️ 기술 스택

### Frontend
- **Flutter** 3.x (Dart)
- **go_router** — 선언적 라우팅
- **Provider** — 상태 관리

### 네트워크
- **Dio** — HTTP 클라이언트 (JWT 인터셉터, 자동 토큰 갱신 포함)
- **Retrofit** — 타입 안전 REST API 클라이언트
- **json_serializable** — 코드 자동 생성 기반 JSON 직렬화
- **flutter_secure_storage** — JWT 토큰 안전 저장

### 기타
- **table_calendar** — 캘린더 UI
- **camera** — 식사 사진 촬영
- **sqflite** — 로컬 데이터베이스
- **shared_preferences** — 사용자 설정 저장

---

## 🗂️ 프로젝트 구조

```
lib/
├── core/
│   ├── network/          # Dio 클라이언트 및 공통 API 응답 모델
│   ├── router/           # go_router 라우팅 설정
│   └── theme/            # 앱 색상, 텍스트 스타일, 테마
├── data/
│   ├── models/           # JSON 데이터 모델 (auth, meal 등)
│   ├── network/          # Retrofit API 클라이언트 인터페이스
│   └── repositories/     # 데이터 접근 추상화 (Repository 패턴)
├── features/
│   ├── auth/             # 로그인, 회원가입
│   ├── home/             # 홈 화면
│   ├── journal/          # 식사 일지 및 상세
│   ├── meal_record/      # 사진 촬영 및 식사 등록
│   ├── insights/         # 건강 인사이트
│   ├── ranking/          # 랭킹
│   ├── profile/          # 프로필 및 설정
│   ├── onboarding/       # 온보딩
│   ├── survey/           # 설문
│   └── design_system/    # 디자인 시스템 레퍼런스 화면
└── shared/
    └── widgets/          # 공용 위젯 (AppCard, MainScaffold 등)
```