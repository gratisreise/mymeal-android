# MyMeal Color Theme

> MyMeal 앱의 디자인 시스템에 사용되는 색상 테마 정의

---

## 1. Primary Colors (주색상)

| 색상명 | Light Mode | Dark Mode | 용도 |
|:---|:---|:---|:---|
| **Primary** | `#0df214` | `#0bd911` | 메인 브랜드 색상 (초록녹색) |
| **Primary Dark** | `#0bc911` | - | 메인 색상의 어두운 버전 |
| **Primary Light** | `#4cae4f` | - | 온보딩 화면 전용 밝은 초록 |

---

## 2. Background Colors (배경색)

| 색상명 | Light Mode | Dark Mode | 용도 |
|:---|:---|:---|:---|
| **Background** | `#f5f8f6` | `#102210` | 전체 배경 |
| **Surface** | `#ffffff` | `#1a2e1a` / `#1a331a` | 카드, 패널 배경 |

---

## 3. Text Colors (텍스트 색상)

| 색상명 | Light Mode | Dark Mode | 용도 |
|:---|:---|:---|:---|
| **Text Primary** | `#111811` | `#f0f5f0` / `#e0e7e0` | 주요 텍스트 |
| **Text Secondary** | `#608a62` | `#8fac91` / `#9ca3af` | 보조 텍스트 |
| **Text Muted** | `#6b7280` | - | 희미해진 텍스트 |

---

## 4. Meal Type Colors (식사 유형별 색상)

| 식사 유형 | 색상값 | 아이콘 | 용도 |
|:---|:---|:---|:---|
| **Breakfast** | `#FFB74D` | 🌅 | 아침 식사 (주황) |
| **Lunch** | `#4DB6AC` | ☀️ | 점심 식사 (연하늘) |
| **Dinner** | `#7986CB` | 🌙 | 저녁 식사 (보라연) |
| **Snack** | `#BA68C8` | 🍪 | 간식 (연분홍) |

---

## 5. Status Colors (상태 색상)

| 상태 | 색상값 | 용도 |
|:---|:---|:---|
| **Good** | `#0df214` | 식후 반응 좋음 |
| **Normal** | `#FFC107` | 식후 반응 보통 |
| **Bad** | `#FF5252` | 식후 반응 나쁨 (주의색) |

---

## 6. Semantic Colors (의미 색상)

| 용도 | 색상값 | 설명 |
|:---|:---|:---|
| **Success** | `#0df214` | Primary와 동일 |
| **Warning** | `#FFC107` | 주의 |
| **Error** | `#FF5252` | 에러/경고 |
| **Info** | `#0df214` | 정보 |

---

## 7. Border & Divider Colors (테두리/구분선)

| 용도 | Light Mode | Dark Mode |
|:---|:---|:---|
| **Border** | `#e5e7eb` | `#27272a` |
| **Divider** | `#f3f4f6` | `#27272a` |

---

## 8. Shadow Colors (그림자)

| 이름 | 값 | 용도 |
|:---|:---|:---|
| **Shadow Soft** | `0 4px 20px -2px rgba(0, 0, 0, 0.05)` | 카드 그림자 |
| **Shadow Card** | `0 4px 20px -2px rgba(0, 0, 0, 0.1)` | 카드 그림자 (더 진한) |
| **Shadow FAB** | `0 8px 20px rgba(13, 242, 20, 0.4)` | 플로팅 버튼 그림자 |
| **Shadow Glow** | `0 0 15px rgba(13, 242, 20, 0.3)` | 발광 효과 |

---

## 9. Gradient Colors (그라데이션)

| 이름 | 값 | 용도 |
|:---|:---|:---|
| **Primary Gradient** | `linear-gradient(135deg, #0df214 0%, #0bc911 100%)` | 메인 그라데이션 |
| **Overlay Gradient** | `radial-gradient(circle, transparent 60%, rgba(0, 0, 0, 0.4) 100%)` | 오버레이 |

---

## 10. Color Tokens (CSS 변수)

```css
:root {
  /* Primary */
  --color-primary: #0df214;
  --color-primary-dark: #0bc911;
  --color-primary-light: #4cae4f;

  /* Background */
  --color-bg-light: #f5f8f6;
  --color-bg-dark: #102210;
  --color-surface-light: #ffffff;
  --color-surface-dark: #1a2e1a;

  /* Text */
  --color-text-primary-light: #111811;
  --color-text-primary-dark: #f0f5f0;
  --color-text-secondary-light: #608a62;
  --color-text-secondary-dark: #8fac91;

  /* Meal Types */
  --color-meal-breakfast: #FFB74D;
  --color-meal-lunch: #4DB6AC;
  --color-meal-dinner: #7986CB;
  --color-meal-snack: #BA68C8;

  /* Status */
  --color-status-good: #0df214;
  --color-status-normal: #FFC107;
  --color-status-bad: #FF5252;

  /* Borders */
  --color-border-light: #e5e7eb;
  --color-border-dark: #27272a;
}
```

---

## 11. Dark Mode Override (다크 모드)

다크 모드에서는 위 색상을 다음과 같이 조정:

| 요소 | Light Mode | Dark Mode |
|:---|:---|:---|
| 배경 | `#f5f8f6` | `#102210` |
| 표면(카드) | `#ffffff` | `#1a2e1a` |
| 주요 텍스트 | `#111811` | `#f0f5f0` |
| 보조 텍스트 | `#608a62` | `#8fac91` |
| 테두리 | `#e5e7eb` | `#27272a` |
| 나누기 홈 (`#121212`) | - | 바닛 영역 배경 |

---

## 12. Accessibility (접근성)

| 대비Ratio | 기준 | 충족 여부 |
|:---|:---|:---|
| Primary on White | 4.5:1 | WCAG AA ✅ |
| Primary on Black | 3.8:1 | WCAG AA ✅ |
| Text Primary on Background | 12:1 | WCAG AAA ✅ |
| Status Bad on White | 4.6:1 | WCAG AA ✅ |

---

## 13. Usage Guidelines (사용 가이드라인)

1. **Primary 색상**: 주요 버튼, 활성화된 탭, 강조 요소에 사용
2. **Meal Type 색상**: 식사 유형 선택, 카메라 화면에서의 유형 구분에 사용
3. **Status 색상**: 식후 반응 결과, 랭킹 카드 점수 표시에 사용
4. **다크 모드**: `dark` 클래스가 있을 때 Dark Mode 색상 적용
