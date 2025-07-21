import json
import os
import random

def load_deck():
    path = os.path.join(os.path.dirname(__file__), "deck_data.json")
    with open(path, "r", encoding="utf-8") as f:
        return json.load(f)

def get_full_deck():
    deck = load_deck()
    full = []
    for tier, cards in deck.items():
        for card in cards:
            if not isinstance(card, dict):
                continue
            full.append({
                "tier": tier,
                "name": card["name"],
                "short": card.get("short", ""),
                "long": card.get("long", ""),
                "reversed_short": card.get("reversed_short", None),
                "reversed_long": card.get("reversed_long", None)
            })
    return full

def draw_cards(n, already_drawn):
    full_deck = get_full_deck()
    available = [c for c in full_deck if c["name"] not in already_drawn]
    drawn = []

    for _ in range(min(n, len(available))):
        card = random.choice(available)
        available.remove(card)
        reversed_card = random.choice([True, False])
        card["reversed"] = reversed_card
        drawn.append(card)

    return drawn

def print_cards(cards, long=False):
    for card in cards:
        reversed_tag = " (reversed)" if card.get("reversed") else ""
        print(f"\n🎴 {card['tier'].upper()} — {card['name']}{reversed_tag}")
        print("-" * 40)
        if card.get("reversed"):
            text = card["reversed_long"] if long else card["reversed_short"]
            if not text:
                text = "(Reversed) A distorted or blocked aspect of the upright meaning."
        else:
            text = card["long"] if long else card["short"]
        print(text)

def main():
    print("🔮 Welcome to the Alchemical Tarot of the Human Condition 🔮\n")
    drawn_names = []

    while True:
        try:
            n = int(input("How many cards would you like to draw? (1–10): "))
            if not 1 <= n <= 10:
                raise ValueError
        except ValueError:
            print("Please enter a number between 1 and 10.")
            continue

        mode = input("Show [s]hort or [l]ong descriptions? (s/l): ").strip().lower()
        long_mode = mode == "l"

        drawn = draw_cards(n, drawn_names)
        drawn_names.extend(c["name"] for c in drawn)

        print_cards(drawn, long=long_mode)

        again = input("\nDraw more cards? (y/n): ").strip().lower()
        if again != "y":
            break

if __name__ == "__main__":
    main()
