<?php

namespace App\Http\Controllers\Approval;

use App\Http\Controllers\Controller;
use App\Models\Reservation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redirect;
use Inertia\Inertia;

class ApprovalController extends Controller
{


    public function index()
    {
        $user = Auth::user();
        $approvals = Reservation::with(['user', 'driver', 'vehicle'])->where(function ($query) {
            $user = Auth::user();
            $query->where('approval1_id', $user->id)->orWhere('approval2_id', $user->id);
        })->whereNull('is_done')->get();
        return Inertia::render('Approval', [
            'approvals' => $approvals,
            'user' => $user,
        ]);
    }


    public function approve(Request $request)
    {
        // dd($request->all());
        $reservation = Reservation::find($request->id);
        if ($request->approve == 'true') {

            if (Auth::user()->id == $reservation->approval1_id) {
                $reservation->update([
                    'aprroval1' => 'aprroved'
                ]);
            } else {
                $reservation->update([
                    'aprroval2' => 'aprroved'
                ]);
            }
        } else {
            if (Auth::user()->id == $reservation->approval1_id) {
                $reservation->update([
                    'aprroval1' => 'rejected',
                    'status' => 'rejected'
                ]);
            } else {
                $reservation->update([
                    'aprroval2' => 'rejected',
                    'status' => 'rejected'
                ]);
            }
        }

        if ($reservation->aprroval1 == 'aprroved' && $reservation->aprroval2 == 'aprroved') {
            $reservation->update([
                'status' => 'approved'
            ]);
        } else if ($reservation->aprroval1 == 'rejected' || $reservation->aprroval2 == 'rejected') {
            $reservation->update([
                'status' => 'rejected'
            ]);
        } else {
            $reservation->update([
                'status' => 'pending'
            ]);
        }

        return redirect()->route('approval.index');
    }
}
