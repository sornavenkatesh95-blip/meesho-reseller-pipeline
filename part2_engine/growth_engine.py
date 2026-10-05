import csv
from typing import Tuple, List

def mom_growth(previous: float, current: float) -> float:
    if previous == 0.0:
        return 0.0
    return round(((current - previous) / previous) * 100.0, 2)

def is_flagged(mom_pct: float, threshold: float = 8.0) -> str:
    variance_magnitude = abs(mom_pct)
    if variance_magnitude == threshold:
        return "escalate_exact_boundary"
    elif variance_magnitude > threshold:
        return "flagged"
    else:
        return "not_flagged"
