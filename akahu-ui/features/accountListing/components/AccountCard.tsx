"use client";
import React, { useState } from "react";
import QRCode from "react-qr-code";
import type { Account } from "../types/Account";

export const AccountCard: React.FC<{ account: Account }> = ({ account }) => {
  const [showQr, setShowQr] = useState(false);

    return (
    <section
      style={{ perspective: 1000 }}
      className="w-full max-w-[400px] h-[400px]"
      aria-label={`Account card for ${account.name}`}
    >
      <div
        className="w-full h-full relative cursor-pointer"
        style={{
          transformStyle: "preserve-3d",
          WebkitTransformStyle: "preserve-3d",
          transition: "transform 0.45s",
          willChange: "transform",
          transform: showQr ? "rotateY(180deg)" : "rotateY(0deg)",
          transformOrigin: "center",
        }}
        onClick={() => setShowQr((s) => !s)}
        role="button"
        tabIndex={showQr ? -1 : 0}
        onKeyDown={(e) => {
          if (e.key === "Enter") setShowQr((s) => !s);
          if (e.key === "Escape") setShowQr(false);
        }}
        aria-pressed={showQr}
        aria-label={`Toggle QR for ${account.name}`}
        aria-hidden={showQr}
      >
        {/* Front */}
        <section
          className="absolute inset-0 border p-4 rounded bg-white flex flex-col justify-between"
          aria-hidden={showQr}
          style={{
            backfaceVisibility: "hidden",
            WebkitBackfaceVisibility: "hidden",
            pointerEvents: showQr ? "none" : "auto",
            zIndex: showQr ? 0 : 2,
          }}
        >
          <div>
            <h2 className="text-lg font-bold">{account.name}</h2>
            <p className="text-sm text-gray-600">{account.number}</p>
            <p className="text-sm text-gray-600">{account.type}</p>
          </div>

          <div className="mt-2">
            <p className="my-2 font-medium">
              {account.balance.currency} {account.balance.current}
            </p>
            <p className="text-xs text-gray-500">Tap to view QR</p>
          </div>
        </section>

        {/* Back (QR) */}
        <section
          className="absolute inset-0 flex items-center justify-center bg-white p-4 rounded"
          aria-hidden={!showQr}
          style={{
            transform: "rotateY(180deg)",
            backfaceVisibility: "hidden",
            WebkitBackfaceVisibility: "hidden",
            pointerEvents: showQr ? "auto" : "none",
            zIndex: showQr ? 3 : 1,
          }}
        >
          <div className="flex flex-col items-center">
            <QRCode
              value={JSON.stringify({ number: account.number, name: account.name })}
              size={300}
            />
            <button
              type="button"
              className="mt-3 text-sm underline"
              tabIndex={showQr ? 0 : -1}
              onClick={(e) => {
                e.stopPropagation();
                setShowQr(false);
              }}
            >
              Close
            </button>
          </div>
        </section>
      </div>
    </section>
  );
};

export default AccountCard;
